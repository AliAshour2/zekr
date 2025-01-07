import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  String _localeCode = 'ar';

  String get localeCode => _localeCode;

  void changeLocale(String code) {
    _localeCode = code;
    notifyListeners();
  }
}
