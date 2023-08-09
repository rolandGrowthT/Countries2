import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/Property_Servics.dart';
import 'package:task_6/models/Property_model.dart';
import 'package:task_6/models/Space_model.dart';

class PropertyProvider extends ChangeNotifier {
  List<PropertyModel> _Properties = [];
  List<PropertyModel> get Properties => _Properties;
  PropertyModel? selectedproperty;
  bool drawerisopen = false;
  Future<void> setdot(SpaceModel space1,int i) async {
    space1.cindex=i;
    notifyListeners();
  }

  PropertyServices service = PropertyServices();
  Future<void> fetchproperties() async {
    _Properties = await service.getAllAvailableProperties();
    selectedproperty = Properties[0];
    notifyListeners();
  }

  Future<void> Updatevalue(PropertyModel p) async {
    selectedproperty = null;
    selectedproperty = p;
    notifyListeners();
  }

  int getlength(PropertyModel p) {
    try {
      return p.availableSpaces.length - 1;
    } catch (e) {
      return 0;
    }
  }
}
