import 'package:evolve/constants/colour_scheme.dart';
import 'package:evolve/constants/dimensions.dart';
import 'package:evolve/controller/auth_controller.dart';
import 'package:evolve/pages/onboarding/views/reset_password.dart';
import 'package:evolve/pages/onboarding/views/signup.dart';
import 'package:evolve/widgets/textinputbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.backgroundColour,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Evolve logo
              Container(
                height: 240,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image:
                        AssetImage("lib/assets/images/evolve_transparent.png"),
                  ),
                ),
              ),
              Column(
                //shrinkWrap: true,
                //reverse: true,

                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.length30, //30
                      right: Dimensions.length30, //30
                      top: Dimensions.length50, //50
                      bottom: Dimensions.length50, //50
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.length150, //10
                        ),

                        // A new you begins here
                        Text(
                          "Sign in",
                          style: theme.textTheme.headline2,
                        ),

                        SizedBox(
                          height: Dimensions.length20, //100
                        ),

                        // Email TextInputBox
                        TextInputBox(
                          height: Dimensions.length40, //40
                          width: Dimensions.screenWidth,
                          hint: "Email Address",
                          icon: FeatherIcons.mail,
                          controller: emailController,
                          function: () {},
                        ),

                        SizedBox(
                          height: Dimensions.length15, //15
                        ),

                        // Password TextInputBox
                        TextInputBox(
                          height: Dimensions.length40, //40
                          width: Dimensions.screenWidth,
                          controller: passwordController,
                          hint: "Password",
                          icon: FeatherIcons.lock,
                          hidden: true,
                          function: () {}
                        ),

                        SizedBox(
                          height: Dimensions.length15, //15
                        ),

                        // Log in button
                        ElevatedButton(
                          onPressed: () {
                            AuthController.instance.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              context,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              Dimensions.screenWidth,
                              Dimensions.screenHeight / 17,
                            ),
                          ),
                          child: Container(
                            width: Dimensions.screenWidth,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.subtitle1!.copyWith(
                                color: theme.backgroundColor,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Dimensions.length15, //15
                        ),

                        // Or sign in with
                        Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.length60, //60
                            right: Dimensions.length60, //60
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: theme.primaryColor,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.length10, //10
                              ),
                              Text(
                                "or sign in with",
                                style: theme.textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: Dimensions.length10, //10
                              ),
                              Expanded(
                                child: Divider(
                                  color: theme.primaryColor,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: Dimensions.length10, //10
                        ),

                        // Logos
                        Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.length60, //60
                            right: Dimensions.length60, //60
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Google Logo
                              Container(
                                width: 45, //50
                                height: 45, //50
                                child: ElevatedButton(
                                  onPressed: () {
                                    AuthController.instance.signInWithGoogle();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    primary: Colors.white,
                                    shadowColor: Colors.black,
                                    elevation: 3,
                                  ),
                                  child: Container(
                                    width: Dimensions.length20, //20
                                    height: Dimensions.length20, //20
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "lib/assets/icons/google.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Facebook Logo
                              Container(
                                width: 45, //50
                                height: 45, //50

                                child: ElevatedButton(
                                  onPressed: () {
                                    AuthController.instance
                                        .signInWithFacebook();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    primary: Colors.white,
                                    shadowColor: Colors.black,
                                    elevation: 3,
                                  ),
                                  child: Container(
                                    width: Dimensions.length20, //20
                                    height: Dimensions.length20, //20
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "lib/assets/icons/facebook.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              /*
                            // Apple Logo
                            Container(
                              width: 50, //50
                              height: 50, //50
                              child: ElevatedButton(
                                onPressed: () {
                                  null;
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: Colors.white,
                                ),
                                child: Container(
                                  width: Dimensions.length20, //20
                                  height: Dimensions.length20, //20
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("lib/assets/icons/apple.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            */
                            ],
                          ),
                        ),

                        SizedBox(
                          height: Dimensions.length60, //60
                        ),

                        Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.length20, //20
                            right: Dimensions.length20, //20
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                  Dimensions.screenWidth / 3,
                                  Dimensions.screenHeight / 17,
                                )),
                                onPressed: () {
                                  Get.to(() => SignUp());
                                },
                                child: Text(
                                  "Create Account",
                                  style: theme.textTheme.bodyText2
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ResetPassword());
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: theme.textTheme.bodyText2,
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
            ],
          ),
        ),
      ),
    );
  }
}