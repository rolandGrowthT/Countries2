import 'package:task_6/models/Space.dart';

class Property {
  String propertyId;
  String propertyName;
  List<Space> availableSpaces;

  Property({required this.propertyId, required this.propertyName, required this.availableSpaces});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      propertyId: json['propertyId'],
      propertyName: json['propertyName'],
      availableSpaces: List<Space>.from(json['availableSpaces'].map((space) => Space.fromJson(space))),
    );
  }

}