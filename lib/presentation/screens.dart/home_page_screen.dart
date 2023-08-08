import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6/models/CurrentUser.dart';
import 'package:task_6/models/Property.dart';
import 'package:task_6/presentation/shared%20widgets/propertycard.dart';
import 'package:task_6/provider/CurrentUser_provider.dart';
import 'package:task_6/provider/Property_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_6/presentation/shared widgets/customdrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Provider.of<Property_provider>(context, listen: false).fetchproperties();
    print('page called');
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    List<Property> properties =
        Provider.of<Property_provider>(context).Properties;
    CurrentUser Cuser = Provider.of<CurrentUser_provider>(context).Cuser;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF9F9F9),
      drawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        backgroundColor: Color(0xFF3C4955),
        toolbarHeight: 150,
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                        print('IconButton pressed!');
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/Group 13892.svg',
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 322,
                    height: 45,
                    margin: EdgeInsets.fromLTRB(0, 56, 0, 2),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(18, 14, 10, 0),
                          child: SvgPicture.asset(
                            'assets/icons/Group 13893.svg',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
                          child: DropdownButton<Property>(
                            isExpanded: true,
                            hint: Text(
                              'Select a property',
                              style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  fontSize: 13),
                            ),
                            value: Provider.of<Property_provider>(context)
                                .selectedproperty,
                            onChanged: (Property? newValue) {
                              Provider.of<Property_provider>(context,
                                      listen: false)
                                  .Updatevalue(newValue!);
                            },
                            items: properties.map<DropdownMenuItem<Property>>(
                                (Property property) {
                              return DropdownMenuItem<Property>(
                                value: property,
                                child: Text(
                                  property.propertyName,
                                  style: TextStyle(
                                      fontFamily: 'MontserratRegular',
                                      fontSize: 13),
                                ),
                              );
                            }).toList(),
                            icon: SvgPicture.asset(
                                'assets/icons/Icon-16x-dropdown.svg'),
                            iconSize: 24,
                            underline: SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 178,
                  height: 45,
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 56),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(18, 14, 10, 0),
                        child: SvgPicture.asset(
                          'assets/icons/Group 13884.svg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
                        child: DropdownButton<Property>(
                          isExpanded: true,
                          hint: Text(
                            'Select Dates',
                            style: TextStyle(
                                fontFamily: 'MontserratRegular', fontSize: 13),
                          ),
                          value: Provider.of<Property_provider>(context)
                              .selectedproperty,
                          onChanged: (Property? newValue) {
                            Provider.of<Property_provider>(context,
                                    listen: false)
                                .Updatevalue(newValue!);
                          },
                          items: properties.map<DropdownMenuItem<Property>>(
                              (Property property) {
                            return DropdownMenuItem<Property>(
                              value: property,
                              child: Text(
                                property.propertyName,
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    fontSize: 13),
                              ),
                            );
                          }).toList(),
                          icon: SvgPicture.asset(
                              'assets/icons/Icon-16x-dropdown2.svg'),
                          iconSize: 24,
                          underline: SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 178,
                  height: 45,
                  margin: EdgeInsets.fromLTRB(6, 8, 0, 56),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(17, 13, 0, 0),
                        child: Icon(
                          Icons.person_add_outlined,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
                        child: DropdownButton<Property>(
                          isExpanded: true,
                          hint: Text(
                            'Guests & Rooms',
                            style: TextStyle(
                                fontFamily: 'MontserratRegular', fontSize: 13),
                          ),
                          value: Provider.of<Property_provider>(context)
                              .selectedproperty,
                          onChanged: (Property? newValue) {
                            Provider.of<Property_provider>(context,
                                    listen: false)
                                .Updatevalue(newValue!);
                          },
                          items: properties.map<DropdownMenuItem<Property>>(
                              (Property property) {
                            return DropdownMenuItem<Property>(
                              value: property,
                              child: Text(
                                property.propertyName,
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    fontSize: 13),
                              ),
                            );
                          }).toList(),
                          icon: SvgPicture.asset(
                              'assets/icons/Icon-16x-dropdown2.svg'),
                          iconSize: 24,
                          underline: SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(28, 20, 145, 0),
            child: Text(
              'Available Properties',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MontserratMedium',
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Provider.of<Property_provider>(context, listen: false)
                    .getlength(Provider.of<Property_provider>(context)
                        .selectedproperty!) +
                1,
            itemBuilder: (context, index) {
              return PropertyCard(
                space: Provider.of<Property_provider>(context)
                    .selectedproperty!
                    .availableSpaces[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
