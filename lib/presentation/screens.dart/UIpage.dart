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
import 'package:task_6/presentation/screens.dart/Results.dart';

class UIpage extends StatefulWidget {
  const UIpage({super.key});

  @override
  State<UIpage> createState() => _UIpageState();
}

class _UIpageState extends State<UIpage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountryProvider>(context, listen: false).fetchCountries();
    Provider.of<LanguageProvider>(context, listen: false).fetchlanguage();
  }

  bool isLoading = false;

  Widget build(BuildContext context) {
    List<CountryModel> countries = Provider.of<CountryProvider>(context).Countries;
    List<CStateModel> states = Provider.of<StateProvider>(context).CStates;
    List<CityVOModel> cities = Provider.of<CityVOProvider>(context).Cities;
    List<LanguageModel> languages =
        Provider.of<LanguageProvider>(context).languages;
    return Scaffold(
      appBar: AppBar(
        title: Text('Country'),
      ),
      body: Center(
        
        child: Stack(
          alignment: Alignment.center,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                child: DropdownButton<CountryModel>(
                  isExpanded: true,
                  hint: Text(
                    'Select your Country',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 20),
                  ),
                  value: Provider.of<CountryProvider>(context).selectedCountry,
                  onChanged: (CountryModel? newValue) {
                    Provider.of<StateProvider>(context, listen: false)
                        .Clearlist();
                    Provider.of<CityVOProvider>(context, listen: false)
                        .Clearlist();
                    Provider.of<StateProvider>(context, listen: false)
                        .fetchStates(newValue!);
                    Provider.of<CountryProvider>(context, listen: false)
                        .Updatevalue(newValue);
                  },
                  items: countries
                      .map<DropdownMenuItem<CountryModel>>((CountryModel country) {
                    return DropdownMenuItem<CountryModel>(
                      value: country,
                      child: Text(
                        country.countryName,
                        style: TextStyle(
                            fontFamily: 'MontserratMedium', fontSize: 20),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                child: DropdownButton<CStateModel>(
                  isExpanded: true,
                  hint: Text(
                    'Select your State',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 20),
                  ),
                  value: Provider.of<StateProvider>(context).selectedState,
                  onChanged: (CStateModel? newValue2) {
                    Provider.of<CityVOProvider>(context, listen: false)
                        .Clearlist();
                    Provider.of<CityVOProvider>(context, listen: false)
                        .fetchCities(newValue2!);
                    Provider.of<StateProvider>(context, listen: false)
                        .Updatevalue(newValue2);
                  },
                  items: states.map<DropdownMenuItem<CStateModel>>((CStateModel cstate) {
                    return DropdownMenuItem<CStateModel>(
                      value: cstate,
                      child: Text(
                        cstate.stateName,
                        style: TextStyle(
                            fontFamily: 'MontserratMedium', fontSize: 20),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                child: DropdownButton<CityVOModel>(
                  isExpanded: true,
                  hint: Text(
                    'Select your City',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 20),
                  ),
                  value: Provider.of<CityVOProvider>(context).selectedCity,
                  onChanged: (CityVOModel? newValue3) {
                    Provider.of<CityVOProvider>(context, listen: false)
                        .Updatevalue(newValue3!);
                  },
                  items: cities.map<DropdownMenuItem<CityVOModel>>((CityVOModel city) {
                    return DropdownMenuItem<CityVOModel>(
                      value: city,
                      child: Text(
                        city.cityName,
                        style: TextStyle(
                            fontFamily: 'MontserratMedium', fontSize: 20),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                child: DropdownButton<LanguageModel>(
                  isExpanded: true,
                  hint: Text(
                    'Select your prefered language',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 15),
                  ),
                  value:
                      Provider.of<LanguageProvider>(context).selectedLanguage,
                  onChanged: (LanguageModel? newValue4) {
                    Provider.of<LanguageProvider>(context, listen: false)
                        .Updatevalue(newValue4!);
                  },
                  items: languages
                      .map<DropdownMenuItem<LanguageModel>>((LanguageModel language) {
                    return DropdownMenuItem<LanguageModel>(
                      value: language,
                      child: Text(
                        language.languageDescription,
                        style: TextStyle(
                            fontFamily: 'MontserratMedium', fontSize: 15),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
            ],
          ),
        // Container(child: CircularProgressIndicator()),
        
        ]),
      ),
    );
  }
}
