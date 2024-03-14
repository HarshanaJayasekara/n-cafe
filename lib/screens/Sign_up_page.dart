import 'package:flutter/material.dart';
import 'package:n_cafe/components/primary_text_component.dart';
import 'package:n_cafe/components/text_styles.dart';
import 'package:n_cafe/components/primary_max_button_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _passwordVisible;
  Color appBarColor = Colors.transparent;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome",
          style: SecondaryTextWhiteStyle(fontSize: 20.0),
        ),
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              if (notification.metrics.pixels > 0) {
                appBarColor = notification.metrics.pixels > 0
                    ? Colors.green
                    : Colors.transparent;
              }

              // changing tha app bar color back to transparent if the keyboard is dissapeared\
              if (notification.metrics.pixels == 0) {
                appBarColor = Colors.transparent;
              }
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signUpimg.png'),
                fit: BoxFit.cover,
                alignment: Alignment(0, 0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Create account",
                              style: PrimaryHeadingTextStyle(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Quickly create account",
                              style: SecondaryTextGrayStyle(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextField(
                          decoration: PrimaryTextComponent(
                            MyHintText: "Student Id",
                            MyPrefixIcon: Icon(Icons.card_membership),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          decoration: PrimaryTextComponent(
                            MyHintText: "Username",
                            MyPrefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          decoration: PrimaryTextComponent(
                            MyHintText: "Student email",
                            MyPrefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          obscureText: !_passwordVisible,
                          decoration: PrimaryTextComponent(
                            MyHintText: "Password",
                            MyPrefixIcon: Icon(Icons.lock_outline),
                            MySuffixIcon: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    _passwordVisible = !_passwordVisible;
                                  },
                                );
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          obscureText: !_passwordVisible,
                          decoration: PrimaryTextComponent(
                            MyHintText: "Confirm password",
                            MyPrefixIcon: Icon(Icons.lock_outline),
                            MySuffixIcon: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    _passwordVisible = !_passwordVisible;
                                  },
                                );
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("Sign up"),
                          style: PrimaryMaxButtonStyle(),
                        ),
                        SizedBox(height: 10.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account?",
                                style: SecondaryTextGrayStyle(),
                              ),
                              TextSpan(
                                text: " Login",
                                style: SecondaryTextBlackStyle(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
