import 'package:flutter/foundation.dart';
import 'package:otaqu/shared-preference/sharedpreference.dart';

class AppIntroProvider with ChangeNotifier{
  List appIntro = [
    {"image": "assets/image/images.jpg", "title": "Travel With\nEasy", "subtitle": "Go anywhere without\ntrouble"},
    {"image": "assets/image/f71a1e00-mount-everest-1280x720.jpg", "title": "Worldwide\nDestination", "subtitle": "Access to visit all\ncountries in one hand"}
  ];

  int _index = 0;

  setIndex(value){
    _index = value;

    notifyListeners();
  }

  int get index{
    return _index;
  }

  bool? status;

  checkAppIntro()async{
    status = await LocalData.prefGetBool(key: 'appIntro');
    notifyListeners();
  }
}