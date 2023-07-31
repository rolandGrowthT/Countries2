import 'package:task_6/models/Country.dart';
import 'package:task_6/models/CState.dart';
import 'package:task_6/models/cityV0.dart';
import 'package:task_6/models/Languages.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompleteProfileService {
  Future<List<Country>> getAllCountries() async {
    var response = await http.get(Uri.parse(
        "http://192.168.88.10:30513/otonomus/common/api/v1/countries?page=0&size=300"));
    var decodedResponse = jsonDecode(response.body);

    var result = decodedResponse['data'] as List;
    final finalResponse = result.map((map) => Country.fromJson(map)).toList();
    return finalResponse;
  }

  Future<List<CState>> getStatesById(Country country) async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/country/${country.idCountry}/states"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse = result.map((map) => CState.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, this country has no state!');
      return [];
    }
  }

  Future<List<CityVO>> getAllCitiesByStateId(CState cstate) async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/state/${cstate.idState}/cities"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse = result.map((map) => CityVO.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, this country has no state!');
      return [];
    }
  }

  Future<List<Language>> getAllPreferredLanguages() async {
    var response = await http.get(Uri.parse(
        "http://192.168.88.10:30513/otonomus/common/api/v1/languages"));
    var decodedResponse = jsonDecode(response.body);
    var result = decodedResponse['data'] as List;
    final finalResponse = result.map((map) => Language.fromJson(map)).toList();
    return finalResponse;
  }
}
