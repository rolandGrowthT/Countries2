import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/CState.dart';
import 'package:task_6/models/Country.dart';
import 'package:task_6/models/Languages.dart';
import 'package:task_6/models/cityV0.dart';
import 'package:task_6/provider/Country_provider.dart';
import 'package:task_6/provider/Language_provider.dart';
import 'package:task_6/provider/State_provider.dart';
import 'package:task_6/provider/cityV0_provider.dart';
import 'package:task_6/presentation/screens.dart/results.dart';

class UIpage extends StatefulWidget {
  const UIpage({super.key});

  @override
  State<UIpage> createState() => _UIpageState();
}

class _UIpageState extends State<UIpage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Country_provider>(context, listen: false).fetchCountries();
    Provider.of<Language_Provider>(context, listen: false).fetchlanguage();
  }

  bool isLoading = false;

  Widget build(BuildContext context) {
    List<Country> countries = Provider.of<Country_provider>(context).Countries;
    List<CState> states = Provider.of<State_provider>(context).CStates;
    List<CityVO> cities = Provider.of<CityVO_Provider>(context).Cities;
    List<Language> languages =
        Provider.of<Language_Provider>(context).languages;
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
                child: DropdownButton<Country>(
                  isExpanded: true,
                  hint: Text(
                    'Select your Country',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 20),
                  ),
                  value: Provider.of<Country_provider>(context).selectedCountry,
                  onChanged: (Country? newValue) {
                    Provider.of<State_provider>(context, listen: false)
                        .Clearlist();
                    Provider.of<CityVO_Provider>(context, listen: false)
                        .Clearlist();
                    Provider.of<State_provider>(context, listen: false)
                        .fetchStates(newValue!);
                    Provider.of<Country_provider>(context, listen: false)
                        .Updatevalue(newValue);
                  },
                  items: countries
                      .map<DropdownMenuItem<Country>>((Country country) {
                    return DropdownMenuItem<Country>(
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
                child: DropdownButton<CState>(
                  isExpanded: true,
                  hint: Text(
                    'Select your State',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 20),
                  ),
                  value: Provider.of<State_provider>(context).selectedState,
                  onChanged: (CState? newValue2) {
                    Provider.of<CityVO_Provider>(context, listen: false)
                        .Clearlist();
                    Provider.of<CityVO_Provider>(context, listen: false)
                        .fetchCities(newValue2!);
                    Provider.of<State_provider>(context, listen: false)
                        .Updatevalue(newValue2);
                  },
                  items: states.map<DropdownMenuItem<CState>>((CState cstate) {
                    return DropdownMenuItem<CState>(
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
                child: DropdownButton<CityVO>(
                  isExpanded: true,
                  hint: Text(
                    'Select your City',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 20),
                  ),
                  value: Provider.of<CityVO_Provider>(context).selectedCity,
                  onChanged: (CityVO? newValue3) {
                    Provider.of<CityVO_Provider>(context, listen: false)
                        .Updatevalue(newValue3!);
                  },
                  items: cities.map<DropdownMenuItem<CityVO>>((CityVO city) {
                    return DropdownMenuItem<CityVO>(
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
                child: DropdownButton<Language>(
                  isExpanded: true,
                  hint: Text(
                    'Select your prefered language',
                    style: TextStyle(
                        fontFamily: 'MontserratRegular', fontSize: 15),
                  ),
                  value:
                      Provider.of<Language_Provider>(context).selectedLanguage,
                  onChanged: (Language? newValue4) {
                    Provider.of<Language_Provider>(context, listen: false)
                        .Updatevalue(newValue4!);
                  },
                  items: languages
                      .map<DropdownMenuItem<Language>>((Language language) {
                    return DropdownMenuItem<Language>(
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
                      builder: (context) => results(),
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
