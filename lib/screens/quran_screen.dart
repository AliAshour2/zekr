import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/models/quran_model.dart';
import 'package:zekr/providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Provider.of<ThemeProvider>(context).isDark
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
