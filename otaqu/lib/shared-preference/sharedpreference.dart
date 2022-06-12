import 'package:shared_preferences/shared_preferences.dart';

class LocalData {

  static prefSaveString({String? key, String? value})async{
    SharedPreferences data = await SharedPreferences.getInstance();
    data.setString(key!, value!);
  }
  static prefSaveBool({String? key, bool? value})async{
    SharedPreferences data = await SharedPreferences.getInstance();
    data.setBool(key!, value!);
  }

  static Future prefGetString({String? key})async{
    SharedPreferences data = await SharedPreferences.getInstance();
    return data.getString(key!) ?? '';
  }

  static Future prefGetBool({String? key})async{
    SharedPreferences data = await SharedPreferences.getInstance();
    return data.getBool(key!) ?? '';
  }

  static prevDelete()async{
    SharedPreferences data = await SharedPreferences.getInstance();
    data.clear();
  }

}