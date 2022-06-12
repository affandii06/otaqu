import 'package:flutter/material.dart';

class OtaquButton extends StatefulWidget {
  void Function()? action;
  double? radius;
  double? height;
  double? width;
  Color? color;
  Color? shadowColor;
  String? title;
  TextStyle? textStyle;
  OtaquButton({
    this.action,
    this.color,
    this.shadowColor,
    this.height,
    this.radius,
    this.title,
    this.width,
    this.textStyle,
    Key? key}) : super(key: key);

  @override
  State<OtaquButton> createState() => _OtaquButtonState();
}

class _OtaquButtonState extends State<OtaquButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.color ?? Colors.black),
        shadowColor: MaterialStateProperty.all(widget.shadowColor ?? Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 0),
          )
        ),
        elevation: MaterialStateProperty.all(10),
      ),
      onPressed: widget.action, 
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Text(widget.title ?? '', style: widget.textStyle)
        ),
      )
    );
  }
}