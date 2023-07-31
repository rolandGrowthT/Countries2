import 'package:flutter/widgets.dart';

class loading extends ChangeNotifier{
  bool toggle = false;
Future<void> toggleon()async{
toggle = true;
}
Future<void> toggleoff()async{
toggle = false;
}
}