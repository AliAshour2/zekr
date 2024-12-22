import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zekr/models/quran_model.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});
  static const String routeName = '/quranScreen';

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> virses = [];
  @override
  Widget build(BuildContext context) {
    QuranModel quranModel =
        ModalRoute.of(context)!.settings.arguments as QuranModel;
    if (virses.isEmpty) loadSuraContent(quranModel.index);
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/bg3.png'),
          //   fit: BoxFit.cover,
          // ),
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
              virses.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Text(
                          virses[index],
                          style: Theme.of(context).textTheme.titleSmall,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: virses.length,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraContent(int index) async {
    rootBundle.loadString('assets/quran/${index + 1}.txt').then((data) {
      virses = data.split('\n');
      setState(() {});
    });
  }
}
