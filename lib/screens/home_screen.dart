import 'package:flutter/material.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/ui/taps/hadeeth_tab.dart';
import 'package:zekr/ui/taps/quran_tab.dart';
import 'package:zekr/ui/taps/radio_tab.dart';
import 'package:zekr/ui/taps/sebha_tab.dart';
import 'package:zekr/ui/taps/settings_tab.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("zekr"),
        ),
        body: tabs[index],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconQuran)),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.iconHadeth)),
                  label: 'Hadeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.iconSebha)),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.iconRadio)),
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ]),
      ),
    );
  }
}
