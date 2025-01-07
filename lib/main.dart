import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zekr/providers/localization_provider.dart';
import 'package:zekr/screens/hadeth_screen.dart';
import 'package:zekr/themes/app_theme.dart';
import 'package:zekr/screens/home_screen.dart';
import 'package:zekr/providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/quran_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LocalizationProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zikr',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LocalizationProvider>(context).localeCode),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).appThemeMode,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranScreen.routeName: (context) => const QuranScreen(),
        HadethScreen.routeName: (context) => const HadethScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
