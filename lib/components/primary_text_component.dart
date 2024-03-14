import 'package:flutter/material.dart';
import 'package:n_cafe/components/text_styles.dart';

InputDecoration PrimaryTextComponent(
    {Icon? MyPrefixIcon, Widget? MySuffixIcon, String? MyHintText}) {
  return InputDecoration(
      hintText: MyHintText,
      hintStyle: TextBoxHintTextGrayStyle(),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      prefixIcon: MyPrefixIcon,
      suffixIcon: MySuffixIcon);
}
