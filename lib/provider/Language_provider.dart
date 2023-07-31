import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/CompleteProfileService.dart';
import 'package:task_6/models/Languages.dart';

class Language_Provider extends ChangeNotifier {
  List<Language> _languages = [];
  List<Language> get languages => _languages;
  Language? selectedLanguage;
  CompleteProfileService service = CompleteProfileService();
  Future<void> fetchlanguage() async {
    _languages = await service.getAllPreferredLanguages();
    notifyListeners();
  }
    Future<void> Updatevalue(Language l) async {
    selectedLanguage = l;
    notifyListeners();
  }
  
  Future<void> Clearlist() async {
    selectedLanguage = null;
    languages.clear();
    notifyListeners();
  }
}
