import 'package:flutter/material.dart';
import 'package:zekr/screens/hadeth_screen.dart';
import 'package:zekr/themes/app_theme.dart';
import 'package:zekr/screens/home_screen.dart';

import 'screens/quran_screen.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranScreen.routeName: (context) => const QuranScreen(),
        HadethScreen.routeName: (context) => const HadethScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
