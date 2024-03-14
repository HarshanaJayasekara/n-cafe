import 'package:flutter/material.dart';

ButtonStyle PrimaryMaxButtonStyle() {
  return ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
    minimumSize: MaterialStateProperty.all(
      Size(double.infinity, 60),
    ),
    textStyle: MaterialStateProperty.all(
      TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 15.0),
    ),
    backgroundColor: MaterialStateProperty.all(
      Color(
        0xFF3AB54B,
      ),
    ),
    foregroundColor: MaterialStateProperty.all(
      Color(
        0xFFFFFFFF,
      ),
    ),
  );
}
