import 'package:flutter/material.dart';
import 'package:n_cafe/components/primary_max_button_style.dart';
import 'package:n_cafe/components/text_styles.dart';

class Verify_Email extends StatelessWidget {
  const Verify_Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "Enter the 4 digit code sent to your at ****@students.nsbm.ac.lk ",
              style: SecondaryTextBlackStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 53.39,
                  height: 50.0,
                  color: Color(0xFFEEEEEE),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xFF000000),
                            width: 2.0,
                            strokeAlign: BorderSide.strokeAlignInside),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       style: BorderStyle.solid,
                      //       color: Color(0xFF000000),
                      //       width: 2.0,
                      //       strokeAlign: BorderSide.strokeAlignInside),
                      // ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                Container(
                  width: 53.39,
                  height: 50.0,
                  color: Color(0xFFEEEEEE),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xFF000000),
                            width: 2.0,
                            strokeAlign: BorderSide.strokeAlignInside),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       style: BorderStyle.solid,
                      //       color: Color(0xFF000000),
                      //       width: 2.0,
                      //       strokeAlign: BorderSide.strokeAlignInside),
                      // ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                Container(
                  width: 53.39,
                  height: 50.0,
                  color: Color(0xFFEEEEEE),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xFF000000),
                            width: 2.0,
                            strokeAlign: BorderSide.strokeAlignInside),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       style: BorderStyle.solid,
                      //       color: Color(0xFF000000),
                      //       width: 2.0,
                      //       strokeAlign: BorderSide.strokeAlignInside),
                      // ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                Container(
                  width: 53.39,
                  height: 50.0,
                  color: Color(0xFFEEEEEE),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xFF000000),
                            width: 2.0,
                            strokeAlign: BorderSide.strokeAlignInside),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       style: BorderStyle.solid,
                      //       color: Color(0xFF000000),
                      //       width: 2.0,
                      //       strokeAlign: BorderSide.strokeAlignInside),
                      // ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "I havent recieved code (0:09)",
              style: SecondaryTextGrayStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: PrimaryMaxButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, '/carts');
              },
              child: Text(
                "Verifyiir",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
