import 'package:flutter/material.dart';
import 'package:zekr/common/app_colors.dart';
import 'package:zekr/common/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(AppImages.radioImage),
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Text(
          AppLocalizations.of(context)!.radioStation,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next,
                color: AppColors.mainLightColor,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow,
                  color: AppColors.mainLightColor, size: 30),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous,
                color: AppColors.mainLightColor,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
