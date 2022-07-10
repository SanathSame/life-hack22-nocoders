import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:get/get.dart';
import 'package:no_coders/scan_page.dart';
import 'package:no_coders/text_input_box.dart';
import 'AuthController.dart';
import 'constants/app_colours.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    AuthController authController = AuthController();

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.backgroundColour,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Sign in",
                      style: TextStyle(
                          color: Color(0xFF73937E),
                          fontSize: 48,
                          fontFamily: 'Nexa'),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    TextInputBox(
                      height: 40,
                      width: width,
                      hint: "Email Address",
                      icon: FeatherIcons.mail,
                      controller: emailController,
                      function: () {},
                    ),

                    const SizedBox(
                      height: 15, //15
                    ),

                    // Password TextInputBox
                    TextInputBox(
                        height: 40, //40
                        width: width,
                        controller: passwordController,
                        hint: "Password",
                        icon: FeatherIcons.lock,
                        hidden: true,
                        function: () {}),

                    const SizedBox(
                      height: 15, //15
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // authController.login(
                        //   emailController.text.trim(),
                        //   passwordController.text.trim(),
                        //   context,
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF73937E),
                      ),
                      child: const Text("Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // Or sign in with
                    Container(
                      margin: const EdgeInsets.only(
                        left: 60,
                        right: 60,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFF73937E),
                              thickness: 1,
                            ),
                          ),
                          const SizedBox(
                            width: 10, //10
                          ),
                          Text(
                            "or sign in with",
                            style: theme.textTheme.bodyText2,
                          ),
                          const SizedBox(
                            width: 10, //10
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xFF73937E),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10, //10
                    ),

                    // Logos
                    Container(
                      margin: const EdgeInsets.only(
                        left: 60, //60
                        right: 60, //60
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Google Logo
                          SizedBox(
                            width: 45, //50
                            height: 45, //50
                            child: ElevatedButton(
                              onPressed: () async {
                                await authController.signInWithGoogle();
                                Future<UserCredential> user =
                                    authController.signInWithGoogle();
                                Get.to(const ScanPage());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                primary: Colors.white,
                                shadowColor: Colors.black,
                                elevation: 3,
                              ),
                              child: Container(
                                width: 30, //20
                                height: 30, //20
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/icons/google.jpg"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60, //60
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20, //20
                        right: 20, //20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                              width / 3,
                              height / 17,
                            )),
                            onPressed: () {},
                            child: Text(
                              "Create Account",
                              style: theme.textTheme.bodyText2
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
