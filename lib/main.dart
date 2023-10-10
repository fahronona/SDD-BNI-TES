import 'package:flutter/material.dart';
import 'package:flutter_bni_sdd/presentation/page/main_menu.dart';
import 'package:flutter_bni_sdd/presentation/style/color_style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: StyleColors.neutralColors40),
        useMaterial3: true,
      ),
    );
  }
}
