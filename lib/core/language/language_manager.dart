import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _local = 'en';
  String get local => _local;
  set local(String local) {
    _local = local;
    notifyListeners();
  }

  void toggleLanguage({required String local}) {
    this.local = local;
  }
}
