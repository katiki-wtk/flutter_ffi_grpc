import "package:flutter/material.dart";

import "native/persons_ffi.dart";
import "grpc_person_page.dart";
import "infolabel.dart";

class FFIPersonBrowser extends StatefulWidget {
  const FFIPersonBrowser({super.key});

  @override
  State<FFIPersonBrowser> createState() => _FFIPersonBrowserState();
}

class _FFIPersonBrowserState extends State<FFIPersonBrowser> {
  late final PersonsNative m_persons;
  bool m_ready = false;

  // Initialize model
  @override
  void initState() {
    super.initState();
    m_persons = PersonsNative.load();
    m_persons.openCsv('c:/tmp/people.csv');
    m_ready = m_persons.count() > 0;
  }

  @override
  void dispose() {
    m_persons.dispose();
    super.dispose();
  }

  // Calls setState to notify widget to be repaint
  void onPrevious() {
    if (m_persons.prev()) {
      setState(() {
        {}
      });
    }
  }

  void onNext() {
    if (m_persons.next()) {
      setState(() {
        {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!m_ready) {
      return const Scaffold(body: Center(child: Text("No data !")));
    }

    final idx = m_persons.index();
    final total = m_persons.count();
    final first = m_persons.firstName();
    final last = m_persons.lastName();
    final age = m_persons.age();

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            'Backend FFI',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            _qmlRoute(
                              const GrpcPersonBrowser(
                                host: 'localhost',
                                port: 50051,
                                useTls: false,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.swap_horiz),
                        label: Text('Backend GRPC'),
                      ),
                    ],
                  ),
                ),

                InfoLabel("First name", first),
                const SizedBox(height: 12),
                InfoLabel("Last name", last),
                const SizedBox(height: 12),
                InfoLabel("Age", "$age"),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    "${idx + 1} / $total",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      onPressed: idx > 0 ? onPrevious : null,
                      child: const Text("Previous"),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: idx + 1 < total ? onNext : null,
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route<T> _qmlRoute<T>(Widget page) {
  return PageRouteBuilder<T>(
    transitionDuration: const Duration(milliseconds: 800),
    reverseTransitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondary, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: const Cubic(0.2, 0.8, 0.2, 1.0),
        reverseCurve: Curves.easeOutCubic,
      );

      final offsetTween =
          Tween<Offset>(begin: const Offset(0.08, 0.0), end: Offset.zero).chain(
            CurveTween(curve: const Interval(0.0, 0.9, curve: Curves.easeOut)),
          );

      final fadeTween = Tween<double>(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: const Interval(0.1, 1.0, curve: Curves.easeOut)),
      );

      return FadeTransition(
        opacity: curved.drive(fadeTween),
        child: SlideTransition(
          position: curved.drive(offsetTween),
          child: child,
        ),
      );
    },
  );
}
