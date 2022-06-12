import 'package:flutter/material.dart';
import 'package:otaqu/provider/destination_provider.dart';
import 'package:otaqu/support-component/form.dart';
import 'package:otaqu/util.dart';
import 'package:provider/provider.dart';

class Destination extends StatefulWidget {
  static const id = "destination";
  const Destination({Key? key}) : super(key: key);

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {

  TextEditingController cSearch = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    final destination = Provider.of<DestinationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: OtaquForm(
          setController: cSearch,
          setShape: 10,
          setHint: 'Type your destination',
          iconAssets: Icon(Icons.search),
          onChange: (value){
            setState(() {
              visible = true;
            });
            print(value);
            destination.setSearchList(hint: value);
          },
        ),
        leadingWidth: 0,
        leading: Container(),
        backgroundColor: OtaquColor.pink,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Visibility(
            visible: visible,
            maintainState: true,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: destination.search.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    setState(() {
                      visible = !visible;
                    });
                    print(destination.searchIndex[index]);
                    destination.getAvailableDestination(destinationId: destination.searchIndex[index].toString());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text(destination.search[index],
                        style: OtaquText.customText(size: 14, color: Colors.black),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  ),
                );
              },
            )
          ),
           Visibility(
            visible: !visible,
            maintainState: true,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: destination.availDestinationModel.data == null ? 0 : destination.availDestinationModel.data!.packages!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){

                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-1, 5),
                          color: Colors.grey,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(destination.availDestinationModel.data!.packages![index].images![0]),
                              fit: BoxFit.cover,
                              onError: (Object exception, StackTrace? stackTrace) {
                                return null;
                              },
                            )
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(destination.availDestinationModel.data!.packages![index].name!,
                              style: OtaquText.customText(size: 14, color: Colors.black),
                            ),
                            Text(OtaquConverter.convertToIdr(number: double.parse(destination.availDestinationModel.data!.packages![index].price.toString()), decimalDigit: 0),
                              style: OtaquText.customText(size: 14, color: Colors.black, weight: FontWeight.w700),
                            ),
                            Text("${destination.availDestinationModel.data!.packages![index].operationTimeIn!} - ${destination.availDestinationModel.data!.packages![index].operationTimeOut!}",
                              style: OtaquText.customText(size: 14, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                );
              },
            )
          ),
        ],
      ),
    );
  }
}