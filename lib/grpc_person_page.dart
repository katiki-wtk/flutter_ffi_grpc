import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

import 'grpc_config.dart';
import 'infolabel.dart';
import 'src/generated/persons.pbgrpc.dart';

///
/// The PersonsApi class wraps the gRpc generated code
///
class PersonsApi {
  final String host;
  final int port;
  final bool useTls;

  late final ClientChannel _channel;
  late final PersonNavigatorClient _client;

  PersonsApi({required this.host, required this.port, this.useTls = false}) {
    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    _client = PersonNavigatorClient(_channel);
  }

  Future<CursorResponse> current() => _client.current(Void());
  Future<CursorResponse> next() => _client.next(Void());
  Future<CursorResponse> previous() => _client.previous(Void());

  Stream<PersonChange> watch() => _client.watch(WatchRequest());

  // NB: no update from FLutter side...for the moment

  Future<void> dispose() async {
    await _channel.shutdown();
  }
}

class GrpcPersonBrowser extends StatefulWidget {
  const GrpcPersonBrowser({super.key});

  @override
  State<GrpcPersonBrowser> createState() => _PersonBrowserState();
}

///
///
class _PersonBrowserState extends State<GrpcPersonBrowser> {
  late final PersonsApi _api;
  // ?  => type nullable
  CursorResponse? _cursor;
  String? _error;
  bool _busy = false;
  StreamSubscription<PersonChange>? _watchSub;

  // Initialize model
  @override
  void initState() {
    super.initState();

    final cfg = context.read<GrpcConfig>();

    // Log grpc config...
    debugPrint('[gRPC] target: ${cfg.host}:${cfg.port}  tls=${cfg.tls}');

    () async {
      try {
        final addrs = await InternetAddress.lookup(cfg.host);
        debugPrint(
          '[gRPC] DNS: ${cfg.host} -> ${addrs.map((a) => a.address).join(", ")}',
        );
      } catch (e) {
        debugPrint('[gRPC] DNS lookup failed for ${cfg.host}: $e');
      }
    }(); // fire-and-forget !!

    _api = PersonsApi(host: cfg.host, port: cfg.port, useTls: cfg.tls);
    _loadCurrent();

    // Subscribe to server and listen for event

    _watchSub = _api.watch().listen(
      (evt) {
        if (!mounted) return;
        if (_cursor != null && evt.index.toInt() == _cursor!.index.toInt()) {
          setState(() {
            _cursor = CursorResponse()
              ..person = evt.person
              ..index = _cursor!.index
              ..total = _cursor!.total
              ..hasPrev = _cursor!.hasPrev
              ..hasNext = _cursor!.hasNext;
          });
        }
      },
      onError: (e) {
        if (!mounted) return;
        setState(() {
          _error = e.toString();
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadCurrent() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final res = await _api.current();
      setState(() {
        _cursor = res;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  Future<void> _goNext() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final res = await _api.next();
      setState(() {
        _cursor = res;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  Future<void> _goPrev() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final res = await _api.previous();
      setState(() {
        _cursor = res;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = _cursor?.person ?? Person();
    final canGoPrev = !_busy && (_cursor?.hasPrev ?? false);
    final canGoNext = !_busy && (_cursor?.hasNext ?? false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Persons Navigator'),
        leadingWidth: 72,
        toolbarHeight: 64,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 36,
          padding: const EdgeInsets.all(12),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_error != null)
                  Text(
                    'Erreur:\n\n$_error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                if (_error == null && _cursor != null) ...[
                  InfoLabel("Firstname", p.firstName),
                  InfoLabel("Lastname", p.lastName),
                  InfoLabel("Age", "${p.age}"),
                  InfoLabel(
                    "Index",
                    "${_cursor!.index}/${(_cursor!.total > 0) ? _cursor!.total - 1 : 0}",
                  ),
                  InfoLabel("Prev", "${_cursor!.hasPrev}"),
                  InfoLabel("Next", "${_cursor!.hasNext}"),
                ],
                if (_cursor == null && _error == null) const Text('Loading...'),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.tonal(
                      onPressed: canGoPrev ? _goPrev : null,
                      child: const Text('Previous'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: _busy ? null : _loadCurrent,
                      child: const Text('Current'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.tonal(
                      onPressed: canGoNext ? _goNext : null,
                      child: const Text('Next'),
                    ),
                  ],
                ),
                if (_busy)
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
