import 'package:flutter/material.dart';
import 'package:otaqu/model/dummy_model.dart';
import 'package:otaqu/provider/destination_provider.dart';
import 'package:otaqu/support-component/listview-horizontal.dart';
import 'package:otaqu/util.dart';
import 'package:otaqu/widget/banner.dart';
import 'package:otaqu/widget/destination-box.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const id = "home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final destination = Provider.of<DestinationProvider>(context, listen: false);
    destination.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('Hello Guest',
            style: OtaquText.customText(
              size: 18,
              color: Colors.white,
              weight: FontWeight.w700
            ),
          ),
        ),
        backgroundColor: OtaquColor.pink,
        elevation: 0,
        actions: const[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.notifications, color: Colors.white, size: 24,),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            height: 100,
            decoration: const BoxDecoration(
              color: OtaquColor.pink,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)  
              )
            ),
            child: Text("Let's visit a place we've\nnever been",
              style: OtaquText.customText(
                size: 16,
                color: Colors.white,
                weight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const HomeBanner(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: OtaquHorizontalList(
              used: 'main service',
              dataList: DummyModel.mainService,
              setHeight: 60,
              setItemHeight: 50,
              setItemWidht: 120,
              borderColor: Colors.black,
              borderWidht: 1,
              border: true,
            ),
          ),
          const DestinationBox(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Last Search',
              style: OtaquText.customText(size: 16, weight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: OtaquHorizontalList(
              used: 'last search',
              dataList: DummyModel.lastSearch,
              setHeight: 60,
              setItemHeight: 50,
              setItemWidht: 120,
              borderColor: Colors.black,
              borderWidht: 1,
              border: true,
            ),
          ),
        ],
      ),
    );
  }
}