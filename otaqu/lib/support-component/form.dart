import 'package:flutter/material.dart';
import 'package:otaqu/util.dart';

class OtaquForm extends StatefulWidget {
  Widget? iconAssets;
  String? setHint;
  bool? setObsecure;
  double? setShape;
  double? setHeight;
  int? line;
  TextEditingController? setController;
  TextInputType? setInputType;
  String? title;
  bool autoFocus;
  void Function(String?)? onChange;
  OtaquForm({
    this.iconAssets,
    this.setHint,
    this.setObsecure,
    this.setShape,
    this.setController,
    this.setInputType,
    this.title,
    this.setHeight,
    this.line,
    this.autoFocus = false,
    this.onChange,
    Key? key}) : super(key: key);

  @override
  State<OtaquForm> createState() => _OtaquFormState();
}

class _OtaquFormState extends State<OtaquForm> {

  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null ? Text(widget.title!, style: OtaquText.customText(color: Colors.black, weight: FontWeight.w500)) : Container(),
        SizedBox(height: widget.title != null ? 10 : 0,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.setShape ?? 0)
          ),
          height: widget.setHeight,
          child: TextFormField(
            validator: (input) {
              if (input!.isEmpty) {
                return 'Please type something';
              }
              return null;
            },
            onChanged: (value){
              widget.onChange!(value);
            },
            autofocus: widget.autoFocus,
            maxLines: widget.line ?? 1,
            controller: widget.setController,
            obscureText: widget.setObsecure == true ? active == false ? true : false : false,
            keyboardType: widget.setInputType ?? TextInputType.text,
            style: OtaquText.customText(size: 14, color: Colors.black, weight: FontWeight.w500),
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: widget.setHint,
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(      
                borderSide: const BorderSide(color: Colors.grey, width: 1),   
                borderRadius: BorderRadius.circular(widget.setShape ?? 0)
              ),  
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(widget.setShape ?? 0)
              ),
              border: OutlineInputBorder(      
                borderSide: const BorderSide(color: Colors.grey, width: 1),   
                borderRadius: BorderRadius.circular(widget.setShape ?? 0)
              ), 
              suffixIcon: widget.iconAssets,
            ),
          ),
        ),
      ],
    );
  }
}