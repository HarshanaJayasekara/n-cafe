import 'package:flutter/material.dart';

TextStyle PrimaryHeadingTextStyle() {
  return TextStyle(fontFamily: 'Poppins-bold', fontSize: 25.0);
}

TextStyle SecondaryTextGrayStyle({double? fontSize}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.0 ?? fontSize,
    fontWeight: FontWeight.w500,
    color: Color(0xFF868889),
  );
}

TextStyle TextBoxHintTextGrayStyle() {
  return TextStyle(
      fontFamily: "Poppins", fontSize: 15.0, fontWeight: FontWeight.w400);
}

TextStyle SecondaryTextHiperLinkStyle() {
  return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: Color(0xFF407EC7));
}

TextStyle SecondaryTextBlackStyle({double? fontSize}) {
  return TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontSize: fontSize ?? 15.0,
      fontWeight: FontWeight.w500);
}

TextStyle SecondaryTextWhiteStyle({double? fontSize}) {
  return TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: fontSize ?? 15.0,
      fontWeight: FontWeight.w500);
}
