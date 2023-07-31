import 'package:task_6/models/CState.dart';
import 'package:task_6/models/cityV0.dart';
import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/CompleteProfileService.dart';

class CityVO_Provider extends ChangeNotifier {
  List<CityVO> _Cities = [];
  List<CityVO> get Cities => _Cities;
  CityVO? selectedCity;

  CompleteProfileService service = CompleteProfileService();

  Future<void> fetchCities(CState cState) async {
    _Cities = await service.getAllCitiesByStateId(cState);
    notifyListeners();
  }

  Future<void> Updatevalue(CityVO c) async {
    selectedCity = c;
    notifyListeners();
  }

  Future<void> Clearlist() async {
    selectedCity = null;
    Cities.clear();
    notifyListeners();
  }
}
