import 'package:flutter/material.dart';
import 'package:task_6/models/CState.dart';
import 'package:task_6/Services.dart/CompleteProfileService.dart';
import 'package:task_6/models/Country.dart';

class State_provider extends ChangeNotifier {
  List<CState> _CStates = [];
  List<CState> get CStates => _CStates;
  CState? selectedState;

  CompleteProfileService service = CompleteProfileService();
  Future<void> fetchStates(Country country) async {
    _CStates = await service.getStatesById(country);
    notifyListeners();
  }

  Future<void> Updatevalue(CState c) async {
    selectedState = c;
    notifyListeners();
  }

  Future<void> Clearlist() async {
    selectedState = null;
    CStates.clear();
    notifyListeners();
  }
}
