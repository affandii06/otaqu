import 'package:flutter/foundation.dart';
import 'package:otaqu/api/otaqu_api.dart';
import 'package:otaqu/model/avail_destination_model.dart';
import 'package:otaqu/model/destination_model.dart';
import 'package:otaqu/shared-preference/sharedpreference.dart';

class DestinationProvider with ChangeNotifier{

  login()async{
    await OtaquApi.login();
  }

  DestinationModel destinationModel = DestinationModel();

  getDestinationList()async{
    String? destinationJson = await LocalData.prefGetString(key: 'destinationList');

    if(destinationJson != null || destinationJson != ''){
      destinationModel = await OtaquApi.getDestinationList();
    }else{
      destinationModel = destinationModelFromJson(destinationJson!);
    }
    notifyListeners();
  }

  List search = [];
  List searchIndex = [];

  setSearchList({String? hint}){
    search = [];
    searchIndex = [];
    for(var list in destinationModel.data!){
      if(list.name!.toLowerCase().contains(hint!)){
        search.add(list.name);
        searchIndex.add(list.destinationId);
      }
    }
    if(hint == null || hint == ''){
      search = [];
      searchIndex = [];
    }
    print(search);
    print(searchIndex);
    notifyListeners();
  }

  AvailDestinationModel availDestinationModel = AvailDestinationModel();

  getAvailableDestination({String? destinationId})async{
    availDestinationModel = await OtaquApi.getAvailableDestination(destinationId: destinationId);
    notifyListeners();
  }
}