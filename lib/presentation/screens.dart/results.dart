import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/CState_model.dart';
import 'package:task_6/models/Country_model.dart';
import 'package:task_6/models/Languages_model.dart';
import 'package:task_6/models/cityV0_model.dart';
import 'package:task_6/provider/Country_provider.dart';
import 'package:task_6/provider/Language_provider.dart';
import 'package:task_6/provider/State_provider.dart';
import 'package:task_6/provider/cityV0_provider.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountryModel? scountry = Provider.of<CountryProvider>(context).selectedCountry;
    CStateModel? cState = Provider.of<StateProvider>(context).selectedState;
    LanguageModel? sLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;
    CityVOModel? sCity = Provider.of<CityVOProvider>(context).selectedCity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              Text(
                '${scountry == null ? "You did not select any country " : "Your Selected country : \n" + scountry.countryName}',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MontserratMedium'),
              ),
              SizedBox(height: 16),
              Text(
                '${cState == null ? "" : "Your Selected State : \n" + cState.stateName}',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MontserratMedium'),
              ),
              SizedBox(height: 16),
              Text(
                '${sCity == null ? "" : "Your selected city : \n" + sCity.cityName}',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MontserratMedium'),
              ),
              SizedBox(height: 16),
              Text(
                '${sLanguage == null ? "You did not select any prefered language" : "Your selected language : \n" + sLanguage.languageCode}',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MontserratMedium'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
