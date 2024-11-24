
import 'package:flutter/material.dart';

const kColorPrimary=Color(0xFF8E97FD);
const kColorLightYellow=Color(0xFFFFECCC);
const kColorLightGrey=Color(0xFFEBEAEC);
class PrimaryFont
{
 static String _fontF='Lato';
  static TextStyle medium(double size){
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: _fontF,
      fontSize: size
    );

  }
  static TextStyle thin(double size){
    return TextStyle(
        fontWeight: FontWeight.w200,
        fontFamily: _fontF,
        fontSize: size
    );

  }
  static TextStyle light(double size){
    return TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: _fontF,
        fontSize: size
    );

  }
}