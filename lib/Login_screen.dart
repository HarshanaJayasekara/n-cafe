import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: AssetImage("assets/images/Login_cover.png"),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: EdgeInsets.only(top: 350.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome N-cafe!",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 30.0,
                          ),

                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Log into your account", style: TextStyle(fontSize: 20.0, fontFamily: "Poppins", color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
