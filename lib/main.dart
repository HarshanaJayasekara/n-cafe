import 'package:flutter/material.dart';
import 'package:n_cafe/add_to_favourite_from_home_screen.dart';
import 'package:n_cafe/screens/Login_screen.dart';
import 'package:n_cafe/screens/Sign_up_page.dart';
import 'package:n_cafe/screens/Verify_Email_Screen.dart';
import 'package:n_cafe/screens/card.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        '/login': (context) => loginScreen(),
        '/verify': (context) => Verify_Email(),
        '/carts': (context) => CartScreen(),
        '/itemDetails': (context) => HomePage(),
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image.asset('assets/images/Rectangle167.png'),
        ),
      ),
    );
  }
}
