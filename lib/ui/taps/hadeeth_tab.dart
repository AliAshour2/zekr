import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/models/hadith_model.dart';
import 'package:zekr/screens/hadeth_screen.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<HadithModel> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadeth();
    }
    return Column(
      children: [
        Image.asset(
          AppImages.quranIconwood,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Text(
          "Hadeeth ",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const Divider(),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Center(
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              HadethScreen.routeName,
                              arguments: ahadethList[index]);
                        },
                        child: Text(
                          ahadethList[index].name,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      height: 2,
                    ),
                itemCount: ahadethList.length))
      ],
    );
  }

  loadHadeth() async {
    String data = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> hadithList = data.trim().split('#');
    hadithList.removeWhere((element) => element.trim().isEmpty);
    for (int i = 0; i < hadithList.length; i++) {
      int index = hadithList[i].trim().indexOf("\n");
      String name = hadithList[i].trim().substring(0, index);
      String content = hadithList[i].trim().substring(index);
      ahadethList.add(HadithModel(name: name, content: content));
      setState(() {});
    }
  }
}
