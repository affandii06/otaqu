import 'package:flutter/material.dart';
import 'package:otaqu/provider/destination_provider.dart';
import 'package:otaqu/screen/destination.dart';
import 'package:otaqu/support-component/form.dart';
import 'package:otaqu/util.dart';
import 'package:provider/provider.dart';

class DestinationBox extends StatefulWidget {
  const DestinationBox({Key? key}) : super(key: key);

  @override
  State<DestinationBox> createState() => _DestinationBoxState();
}

class _DestinationBoxState extends State<DestinationBox> {

  TextEditingController cSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final destination = Provider.of<DestinationProvider>(context);
    return Container(
      alignment: Alignment.center,
      height: 300,
      color: OtaquColor.softGrey3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(-1, 5),
              color: Colors.grey,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Where you want to go ?',
              style: OtaquText.customText(size: 16, weight: FontWeight.w700, color: Colors.black),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                destination.getDestinationList();
                destination.setSearchList(hint: '');
                Navigator.pushNamed(context, Destination.id);
              },
              child: AbsorbPointer(
                absorbing: true,
                child: SizedBox(
                  width: 220,
                  child: OtaquForm(
                    setController: cSearch,
                    setShape: 10,
                    setHint: 'Type your destination',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}