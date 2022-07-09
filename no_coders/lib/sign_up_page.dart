import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/app_colours.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColours.backgroundColour,
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
                          "Sign Up",
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
                            function: () {}),
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
                            function: () {}),

                        SizedBox(
                          height: Dimensions.length15, //15
                        ),

                        ElevatedButton(
                          onPressed: () {
                            AuthController.instance.register(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                            /*
                          AuthController.instance.user == null
                              ? null
                              : Get.to(() => OnboardingInitialPage());
                              */
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              Dimensions.screenWidth,
                              Dimensions.screenHeight / 17,
                            ),
                          ),
                          child: SizedBox(
                            width: Dimensions.screenWidth,
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyText2!.copyWith(
                                color: theme.backgroundColor,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Dimensions.length15, //15
                        ),

                        // Or sign up with
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
                              const Text("or sign up with"),
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
                              SizedBox(
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
                              SizedBox(
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
                                  decoration: BoxDecoration(
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
                          height: Dimensions.length75, //60
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Login());
                          },
                          child: SizedBox(
                            width: Dimensions.screenWidth,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Already have an account?",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
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
