import 'package:flutter/material.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/ui/taps/hadeeth_tab.dart';
import 'package:zekr/ui/taps/quran_tab.dart';
import 'package:zekr/ui/taps/radio_tab.dart';
import 'package:zekr/ui/taps/sebha_tab.dart';
import 'package:zekr/ui/taps/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = const [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Theme.of(context).brightness == Brightness.dark
                ? AppImages.darkBg // Use dark mode image
                : AppImages.bg3, // Use light mode image
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islamy),
        ),
        body: tabs[index],
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppImages.iconQuran)),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage(AppImages.iconHadeth)),
                    label: AppLocalizations.of(context)!.hadith),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage(AppImages.iconSebha)),
                    label: AppLocalizations.of(context)!.azkar),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage(AppImages.iconRadio)),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ]),
        ),
      ),
    );
  }
}
