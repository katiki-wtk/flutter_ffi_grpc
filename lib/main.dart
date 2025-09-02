import 'dart:async';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

import "ffi_person_page.dart";

void main() {
  Timer.periodic(const Duration(seconds: 1), (_) => debugPrint('tick'));

  runApp(
    Listener(
      onPointerHover: (e) => debugPrint('hover ${e.position}'),
      onPointerMove: (e) => debugPrint('move  ${e.position}'),
      child: const MinimalApp(),
    ),
  );
}

class MinimalApp extends StatelessWidget {
  const MinimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const FFIPersonBrowser(),
    );
  }
}
