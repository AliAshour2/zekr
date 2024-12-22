import 'package:flutter/material.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/models/hadith_model.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});
  static const String routeName = '/hadethScreen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadithModel> virses = [];

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)!.settings.arguments as HadithModel;
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
                hadithModel.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).dividerTheme.color,
                indent: MediaQuery.of(context).size.width * 0.05,
                endIndent: MediaQuery.of(context).size.width * 0.05,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    hadithModel.content,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
