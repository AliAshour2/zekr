import 'package:flutter/material.dart';
import 'package:zekr/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zikr',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
