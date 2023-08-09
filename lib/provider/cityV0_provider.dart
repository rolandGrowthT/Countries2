import 'package:task_6/models/CState_model.dart';
import 'package:task_6/models/cityV0_model.dart';
import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/CompleteProfile_Services.dart';

class CityVOProvider extends ChangeNotifier {
  List<CityVOModel> _Cities = [];
  List<CityVOModel> get Cities => _Cities;
  CityVOModel? selectedCity;

  CompleteProfileServices service = CompleteProfileServices();

  Future<void> fetchCities(CStateModel cState) async {
    _Cities = await service.getAllCitiesByStateId(cState);
    notifyListeners();
  }

  Future<void> Updatevalue(CityVOModel c) async {
    selectedCity = c;
    notifyListeners();
  }

  Future<void> Clearlist() async {
    selectedCity = null;
    Cities.clear();
    notifyListeners();
  }
}
