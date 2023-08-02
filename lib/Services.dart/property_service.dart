import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:task_6/models/Property.dart';

class propertyservice {
  Future<List<Property>> getAllAvailableProperties() async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:31535/otonomus/inventory/api/v1/spaces/available_spaces"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse =
          result.map((map) => Property.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, No available properties with available spaces');
      return [];
    }
  }
}
