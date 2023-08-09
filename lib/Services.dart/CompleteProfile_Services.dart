import 'package:task_6/models/Country_model.dart';
import 'package:task_6/models/CState_model.dart';
import 'package:task_6/models/cityV0_model.dart';
import 'package:task_6/models/Languages_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CompleteProfileServices {
  Future<List<CountryModel>> getAllCountries() async {
    var response = await http.get(Uri.parse(
        "http://192.168.88.10:30513/otonomus/common/api/v1/countries?page=0&size=300"));
    var decodedResponse = jsonDecode(response.body);

    var result = decodedResponse['data'] as List;
    final finalResponse = result.map((map) => CountryModel.fromJson(map)).toList();
    return finalResponse;
  }

  Future<List<CStateModel>> getStatesById(CountryModel country) async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/country/${country.idCountry}/states"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse = result.map((map) => CStateModel.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, this country has no state!');
      return [];
    }
  }

  Future<List<CityVOModel>> getAllCitiesByStateId(CStateModel cstate) async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/state/${cstate.idState}/cities"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse = result.map((map) => CityVOModel.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, this country has no state!');
      return [];
    }
  }

  Future<List<LanguageModel>> getAllPreferredLanguages() async {
    var response = await http.get(Uri.parse(
        "http://192.168.88.10:30513/otonomus/common/api/v1/languages"));
    var decodedResponse = jsonDecode(response.body);
    var result = decodedResponse['data'] as List;
    final finalResponse = result.map((map) => LanguageModel.fromJson(map)).toList();
    return finalResponse;
  }
}
