import 'package:flutter/material.dart';
import 'package:zekr/common/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppImages.iconQuran)),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.iconHadeth)),
              label: 'Hadeth'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.iconSebha)), label: 'Sebha'),
        ]),
        body: ,
      ),
    );
  }
}
