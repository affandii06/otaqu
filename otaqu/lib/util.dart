import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OtaquColor{
  static const pink = Color(0xFFE91E5A);
  static const yellow = Color(0xFFFFC90E);
  static const purple = Color(0xFF58489D);
  static const blue = Color(0xFF41C0F0);
  static const greySolid = Color(0xFF4C4C4C);
  static const softGrey = Color(0xFFA0A0A0);
  static const softGrey2 = Color(0xFFC8C8C8);
  static const softGrey3 = Color(0xFFF5F6F8);
}

class OtaquText{
  static customText({
    double? size,
    FontWeight? weight, 
    Color? color, 
    double? letterSpacing, 
    TextDecoration? decoration, 
    FontStyle? style,
    List<Shadow>? shadow,
  }){
    return GoogleFonts.nunito(
      letterSpacing: letterSpacing ?? 0,
      fontSize: size ?? 12,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.none,
      fontStyle: style ?? FontStyle.normal,
      shadows: shadow
    );
  }
}

class OtaquConverter{
  static String convertToIdr({dynamic number, int? decimalDigit}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}