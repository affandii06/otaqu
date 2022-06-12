import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otaqu/util.dart';

class OtaquHorizontalList extends StatefulWidget {
  void Function(int)? action;
  String? used;
  List? dataList;
  double? setItemWidht;
  double? setItemHeight;
  double? setHeight;
  int? type;
  double? borderWidht;
  Color? borderColor;
  bool border;
  BoxFit? fit;
  TextStyle? titleStyle;
  int? itemLength;
  int? titleLength;
  OtaquHorizontalList({
    this.used,
    this.action,
    this.dataList,
    this.setItemWidht,
    this.setItemHeight,
    this.setHeight,
    this.border = false,
    this.type,
    this.borderColor,
    this.borderWidht,
    this.fit,
    this.titleStyle,
    this.itemLength,
    this.titleLength,
    Key? key}) : super(key: key);

  @override
  State<OtaquHorizontalList> createState() => _OtaquHorizontalListState();
}

class _OtaquHorizontalListState extends State<OtaquHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.setHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dataList!.length,
        itemBuilder: (context, index){
          if(widget.used == 'main service'){
            return Container(
              margin: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white, 
                border: widget.border == true ? Border.all(color: widget.borderColor ?? Colors.black, width: widget.borderWidht ?? 0) : null,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-1, 5),
                    color: Colors.grey,
                    blurRadius: 10,
                  )
                ],
              ),
              height: widget.setItemHeight,
              width: widget.setItemWidht,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(widget.dataList![index]['image'], width: 30, height: 30,),
                  const SizedBox(width: 10,),
                  Text(widget.dataList![index]['title'],
                    style: OtaquText.customText(size: 16, weight: FontWeight.w700, color: OtaquColor.blue),
                  )
                ],
              ),
            );
          }
          if(widget.used == "last search"){
            return Container(
              margin: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white, 
                border: widget.border == true ? Border.all(color: widget.borderColor ?? Colors.black, width: widget.borderWidht ?? 0) : null,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-1, 5),
                    color: Colors.grey,
                    blurRadius: 10,
                  )
                ],
              ),
              height: widget.setItemHeight,
              width: widget.setItemWidht,
              child: Center(
                child: Text(widget.dataList![index],
                  style: OtaquText.customText(size: 16, weight: FontWeight.w700, color: Colors.black),
                ),
              ),
            );
          }
          return Container();
        }
      ),
    );
  }
}