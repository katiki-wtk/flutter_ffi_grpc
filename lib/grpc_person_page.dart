import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'infolabel.dart';
import 'src/generated/persons.pb.dart';
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
  final String host;
  final int port;
  final bool useTls;

  const GrpcPersonBrowser({
    super.key,
    required this.host,
    required this.port,
    this.useTls = false,
  });

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
    _api = PersonsApi(
      host: widget.host,
      port: widget.port,
      useTls: widget.useTls,
    );
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
      appBar: AppBar(title: const Text('Persons Navigator')),
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

/*
  @override
  Widget build(BuildContext context) {
    final p = _cursor?.person ?? Person();
    final idx = _cursor?.index ?? 0;
    final total = _cursor?.total ?? 0;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- Header "Backend GRPC" + bouton vers FFI ---
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Theme.of(context).colorScheme.primaryContainer,
                                Theme.of(
                                  context,
                                ).colorScheme.secondaryContainer,
                              ],
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 16,
                                spreadRadius: -4,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Text(
                            'Backend GRPC',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: () {
                          // Retour à la page FFI
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.swap_horiz),
                        label: const Text('Backend FFI'),
                      ),
                    ],
                  ),
                ),

                if (_error != null) ...[
                  Text(
                    'Erreur:\n\n$_error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                if (_cursor == null && _error == null) ...[
                  const Text('Chargement…'),
                  const SizedBox(height: 12),
                ],

                if (_cursor != null) ...[
                  InfoLabel("First name", p.firstName),
                  const SizedBox(height: 12),
                  InfoLabel("Last name", p.lastName),
                  const SizedBox(height: 12),
                  InfoLabel("Age", "${p.age}"),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      "${(total > 0) ? (idx + 1) : 0} / $total",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                        onPressed: (_busy || idx <= 0) ? null : _goPrev,
                        child: const Text("Previous"),
                      ),
                      const SizedBox(width: 12),
                      FilledButton(
                        onPressed: (_busy || (idx + 1 >= total))
                            ? null
                            : _goNext,
                        child: const Text("Next"),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'infolabel.dart';
import 'src/generated/persons.pb.dart';
import 'src/generated/persons.pbgrpc.dart';

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

  Future<void> dispose() async {
    await _channel.shutdown();
  }
}

class GrpcPersonBrowser extends StatefulWidget {
  final String host;
  final int port;
  final bool useTls;

  const GrpcPersonBrowser({
    super.key,
    required this.host,
    required this.port,
    this.useTls = false,
  });

  @override
  State<GrpcPersonBrowser> createState() => _PersonBrowserState();
}

class _PersonBrowserState extends State<GrpcPersonBrowser> {
  late final PersonsApi _api;
  CursorResponse? _cursor;
  String? _error;
  bool _busy = false;

  // Initialize model
  @override
  void initState() {
    super.initState();
    _api = PersonsApi(
      host: widget.host,
      port: widget.port,
      useTls: widget.useTls,
    );
    _loadCurrent();
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
    return Scaffold(
      appBar: AppBar(title: const Text('Persons Navigator')),
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
                  InfoLabel("Firstname", p.lastName),
                  InfoLabel("Lastname", p.firstName),
                  InfoLabel("Age", "${p.age}"),
                  InfoLabel(
                    "Index",
                    "${_cursor!.index}/${(_cursor!.total > 0) ? _cursor!.total - 1 : 0}",
                  ),
                  InfoLabel("Prev", "${_cursor!.hasPrev}"),
                  InfoLabel("Next", "${_cursor!.hasNext}"),
                ],
                if (_cursor == null && _error == null)
                  const Text('Chargement…'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.tonal(
                      onPressed: _busy ? null : _goPrev,
                      child: const Text('Previous'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: _busy ? null : _loadCurrent,
                      child: const Text('Current'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.tonal(
                      onPressed: _busy ? null : _goNext,
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
*/
