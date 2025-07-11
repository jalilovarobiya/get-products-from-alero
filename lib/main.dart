import 'package:dars15/vievmodel/viewmodel.dart';
import 'package:dars15/views/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(viewmodel: Viewmodel()),
    );
  }
}
