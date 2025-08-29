import "package:flutter/material.dart";

import "ffi_person_page.dart";

void main() => runApp(const MinimalApp());

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
