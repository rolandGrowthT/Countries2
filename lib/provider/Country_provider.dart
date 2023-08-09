import 'package:flutter/material.dart';
import 'package:task_6/models/Country_model.dart';
import 'package:task_6/Services.dart/CompleteProfile_Services.dart';

class CountryProvider extends ChangeNotifier {
  List<CountryModel> _Countries = [];
  List<CountryModel> get Countries => _Countries;
  CountryModel? selectedCountry;
  CompleteProfileServices service = CompleteProfileServices();
  Future<void> fetchCountries() async {
    _Countries = await service.getAllCountries();
    notifyListeners();
  }

  Future<void> Updatevalue(CountryModel c) async {
    selectedCountry = null;
    selectedCountry = c;
    notifyListeners();
  }
}
