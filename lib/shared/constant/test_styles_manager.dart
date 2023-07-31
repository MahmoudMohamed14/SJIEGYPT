import 'package:flutter/material.dart';


import 'fonst_manager.dart';



TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,{double? height}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      height:height ,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color,double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,height: height);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color,double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,height:  height);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color,double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,height:  height);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color,double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,height:  height);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color,double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,height:  height);
}