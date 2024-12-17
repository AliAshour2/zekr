import 'package:flutter/material.dart';
import 'package:zekr/models/quran_model.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  static const String routeName = '/quranScreen';

  @override
  Widget build(BuildContext context) {
    QuranModel quranModel =
        ModalRoute.of(context)!.settings.arguments as QuranModel;
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
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.09,
              vertical: MediaQuery.of(context).size.height * 0.02),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
              vertical: MediaQuery.of(context).size.height * 0.09),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                quranModel.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).dividerTheme.color,
                indent: MediaQuery.of(context).size.width * 0.05,
                endIndent: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
