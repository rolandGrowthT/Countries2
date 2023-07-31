import 'package:flutter/material.dart';
import 'package:task_6/models/Country.dart';
import 'package:task_6/Services.dart/CompleteProfileService.dart';

class Country_provider extends ChangeNotifier {
  List<Country> _Countries = [];
  List<Country> get Countries => _Countries;
  Country? selectedCountry;
  CompleteProfileService service = CompleteProfileService();
  Future<void> fetchCountries() async {
    _Countries = await service.getAllCountries();
    notifyListeners();
  }

  Future<void> Updatevalue(Country c) async {
    selectedCountry = null;
    selectedCountry = c;
    notifyListeners();
  }
}
