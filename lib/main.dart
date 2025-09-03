import 'dart:async';
import 'package:provider/provider.dart';
import "package:flutter/material.dart";

import "grpc_config.dart";
import "ffi_person_page.dart";

Future<void> main() async {
  Timer.periodic(const Duration(seconds: 1), (_) => debugPrint('tick'));

  WidgetsFlutterBinding.ensureInitialized();
  final cfg = await GrpcConfig.load();

  runApp(
    Listener(
      onPointerHover: (e) => debugPrint('hover ${e.position}'),
      onPointerMove: (e) => debugPrint('move  ${e.position}'),
      child: Provider<GrpcConfig>.value(value: cfg, child: const MinimalApp()),
    ),
  );
}

class MinimalApp extends StatelessWidget {
  const MinimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const FFIPersonBrowser(),
    );
  }
}
