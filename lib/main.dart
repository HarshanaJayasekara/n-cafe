import 'package:cart_page/pages/card.dart';
import 'package:cart_page/pages/wigete.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Cart Example',
      home: CartScreen(),
    );
  }
}
