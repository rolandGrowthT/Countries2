import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/CompleteProfile_Services.dart';
import 'package:task_6/models/Languages_model.dart';

class LanguageProvider extends ChangeNotifier {
  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;
  LanguageModel? selectedLanguage;
  CompleteProfileServices service = CompleteProfileServices();
  Future<void> fetchlanguage() async {
    _languages = await service.getAllPreferredLanguages();
    notifyListeners();
  }
    Future<void> Updatevalue(LanguageModel l) async {
    selectedLanguage = l;
    notifyListeners();
  }
  
  Future<void> Clearlist() async {
    selectedLanguage = null;
    languages.clear();
    notifyListeners();
  }
}
