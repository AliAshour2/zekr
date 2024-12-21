import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/models/quran_model.dart';
import 'package:zekr/screens/quran_screen.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> surah = [];
  List<int> virsesCount = [];

  @override
  Widget build(BuildContext context) {
    if (surah.isEmpty || virsesCount.isEmpty) {
      loadSuraNames();
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        Image.asset(
          AppImages.quranIconwood,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Text(
          "Sura Name",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              endIndent: 20,
              height: 2,
              indent: 20,
            ),
            itemCount: surah.length,
            itemBuilder: (context, index) {
              return Center(
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        QuranScreen.routeName,
                        arguments: QuranModel(name: surah[index], index: index),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            virsesCount.isNotEmpty && index < virsesCount.length
                                ? virsesCount[index].toString()
                                : "0",
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            surah[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> loadSuraNames() async {
    // Load surah names and then load verses count
    await Future.delayed(const Duration(seconds: 1));
    rootBundle.loadString('assets/surah/surah_names.txt').then((data) {
      setState(() {
        surah = data.split('\n').map((String e) => e.trim()).toList();
      });
      loadSura(); // Call loadSura after loading surah names
    }).catchError((error) {
      debugPrint("Error loading surah names: $error");
    });
  }

  Future<void> loadSura() async {
    List<int> _versisCount = [];
    for (int i = 0; i < surah.length; i++) {
      try {
        String data = await rootBundle.loadString('assets/quran/${i + 1}.txt');
        List<String> content = data.trim().split('\n');
        content.removeWhere((element) => element.isEmpty);
        _versisCount.add(content.length);
      } catch (e) {
        // Handle missing file or other errors gracefully
        debugPrint("Error loading verses for surah ${i + 1}: $e");
        _versisCount.add(0);
      }
    }
    setState(() {
      virsesCount = _versisCount;
    });
  }
}
