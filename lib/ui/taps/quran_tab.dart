import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zekr/common/app_images.dart';
import 'package:zekr/models/quran_model.dart';
import 'package:zekr/screens/quran_screen.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> arSuras = [
      "الفاتحه",
      "البقرة",
      "آل عمران",
      "النساء",
      "المائدة",
      "الأنعام",
      "الأعراف",
      "الأنفال",
      "التوبة",
      "يونس",
      "هود",
      "يوسف",
      "الرعد",
      "إبراهيم",
      "الحجر",
      "النحل",
      "الإسراء",
      "الكهف",
      "مريم",
      "طه",
      "الأنبياء",
      "الحج",
      "المؤمنون",
      "النّور",
      "الفرقان",
      "الشعراء",
      "النّمل",
      "القصص",
      "العنكبوت",
      "الرّوم",
      "لقمان",
      "السجدة",
      "الأحزاب",
      "سبأ",
      "فاطر",
      "يس",
      "الصافات",
      "ص",
      "الزمر",
      "غافر",
      "فصّلت",
      "الشورى",
      "الزخرف",
      "الدّخان",
      "الجاثية",
      "الأحقاف",
      "محمد",
      "الفتح",
      "الحجرات",
      "ق",
      "الذاريات",
      "الطور",
      "النجم",
      "القمر",
      "الرحمن",
      "الواقعة",
      "الحديد",
      "المجادلة",
      "الحشر",
      "الممتحنة",
      "الصف",
      "الجمعة",
      "المنافقون",
      "التغابن",
      "الطلاق",
      "التحريم",
      "الملك",
      "القلم",
      "الحاقة",
      "المعارج",
      "نوح",
      "الجن",
      "المزّمّل",
      "المدّثر",
      "القيامة",
      "الإنسان",
      "المرسلات",
      "النبأ",
      "النازعات",
      "عبس",
      "التكوير",
      "الإنفطار",
      "المطفّفين",
      "الإنشقاق",
      "البروج",
      "الطارق",
      "الأعلى",
      "الغاشية",
      "الفجر",
      "البلد",
      "الشمس",
      "الليل",
      "الضحى",
      "الشرح",
      "التين",
      "العلق",
      "القدر",
      "البينة",
      "الزلزلة",
      "العاديات",
      "القارعة",
      "التكاثر",
      "العصر",
      "الهمزة",
      "الفيل",
      "قريش",
      "الماعون",
      "الكوثر",
      "الكافرون",
      "النصر",
      "المسد",
      "الإخلاص",
      "الفلق",
      "الناس"
    ];

    return Column(
      children: [
        Image.asset(
          AppImages.quranScreenLogo,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              endIndent: 20,
              height: 2,
              indent: 20,
            ),
            itemCount: arSuras.length,
            itemBuilder: (context, index) {
              return Center(
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(QuranScreen.routeName,
                          arguments:
                              QuranModel(name: arSuras[index], index: index));
                    },
                    child: Text(
                      arSuras[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
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
}
