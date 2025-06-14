import 'package:flutter/material.dart';
import 'package:paradigma/screens/main/ui/main_screen.dart';
import 'common/uiTheme.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'paradigma',
      theme: UiTheme.getLightTheme(),
      home: const MainScreen(),
    );
  }
}