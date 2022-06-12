import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:otaqu/env.dart';
import 'package:otaqu/model/avail_destination_model.dart';
import 'package:otaqu/model/destination_model.dart';
import 'package:otaqu/shared-preference/sharedpreference.dart';

class OtaquApi{

  static login()async{
    String url = Environtment.login;

    var response = await http.post(Uri.parse(url),
      body: {
        "username" :"otaqu",
  	    "password" : "qwerty"
      }
    );

    var data = jsonDecode(response.body);
    print(data);

    if(data['code'] == 200){
      LocalData.prefSaveString(key: 'token', value: data['data']['access_token']);
    }else{
      print(data['message']);
    }
  }

  static getDestinationList()async{
    String url = Environtment.destination;
    String token = await LocalData.prefGetString(key: 'token');

    var response = await http.get(Uri.parse(url),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );

    var data = jsonDecode(response.body);
    print(data);

    if(data['code'] == 200){
      LocalData.prefSaveString(key: 'destinationList', value: response.body);
      return destinationModelFromJson(response.body);
    }else{
      print(data['message']);
      print('try to get token again');
      login();
      getDestinationList();
    }
  }

  static getAvailableDestination({String? destinationId})async{
    String url = Environtment.avail;
    String token = await LocalData.prefGetString(key: 'token');

    var response = await http.post(Uri.parse(url),
      headers: {
        "Authorization" : "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "type_source": "location",
        "type_id":3,
        "destination_id": int.parse(destinationId!),
        "min_price": 0,
        "max_price": 10000000000,
        "page": 1,
        "order_by": "lowest",
        "reference": "search"
      })
    );

    var data = jsonDecode(response.body);
    print(data);

    if(data['code'] == 200){
      return availDestinationModelFromJson(response.body);
    }else{
      print(data['message']);
      print('try to get token again');
      login();
      getDestinationList();
    }
  }

}