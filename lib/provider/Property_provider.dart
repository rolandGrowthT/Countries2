import 'package:flutter/material.dart';
import 'package:task_6/Services.dart/property_service.dart';
import 'package:task_6/models/Property.dart';
import 'package:task_6/models/Space.dart';

class Property_provider extends ChangeNotifier {
  List<Property> _Properties = [];
  List<Property> get Properties => _Properties;
  Property? selectedproperty;
  Future<void> setdot(Space space1,int i) async {
    space1.cindex=i;
    notifyListeners();
  }

  propertyservice service = propertyservice();
  Future<void> fetchproperties() async {
    _Properties = await service.getAllAvailableProperties();
    selectedproperty = Properties[0];
    notifyListeners();
  }

  Future<void> Updatevalue(Property p) async {
    selectedproperty = null;
    selectedproperty = p;
    notifyListeners();
  }

  int getlength(Property p) {
    try {
      return p.availableSpaces.length - 1;
    } catch (e) {
      return 0;
    }
  }
}
