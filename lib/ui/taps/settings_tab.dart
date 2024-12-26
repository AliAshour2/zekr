import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zekr/common/app_colors.dart';
import 'package:zekr/providers/theme_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            value: Provider.of<ThemeProvider>(context).isDark,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false)
                  .changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
            activeColor: AppColors.gold,
            thumbColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.onSurface),
            inactiveTrackColor: Colors.grey,
          ),
          ListTile(
            title: Text(
              'language',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18.0),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButton(
                icon: const Icon(Icons.language_outlined),
                borderRadius: BorderRadius.circular(20.0),
                underline: Container(),
                value: 'en',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 15.0,
                    ),
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      'English',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(
                      'العربية',
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
