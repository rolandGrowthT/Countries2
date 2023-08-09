import 'package:flutter/material.dart';
import 'package:task_6/models/CState_model.dart';
import 'package:task_6/Services.dart/CompleteProfile_Services.dart';
import 'package:task_6/models/Country_model.dart';

class StateProvider extends ChangeNotifier {
  List<CStateModel> _CStates = [];
  List<CStateModel> get CStates => _CStates;
  CStateModel? selectedState;

  CompleteProfileServices service = CompleteProfileServices();
  Future<void> fetchStates(CountryModel country) async {
    _CStates = await service.getStatesById(country);
    notifyListeners();
  }

  Future<void> Updatevalue(CStateModel c) async {
    selectedState = c;
    notifyListeners();
  }

  Future<void> Clearlist() async {
    selectedState = null;
    CStates.clear();
    notifyListeners();
  }
}
