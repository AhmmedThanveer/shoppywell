import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopywell/View%20Model/Firebase/authservice.dart';
import 'package:shopywell/View%20Model/Firebase/google_signin.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Forgot%20Password%20Screen/UI/forgotpasswordscreen.dart';
import 'package:shopywell/View/Screens/Login%20Screen/Widgets/signuptextbutton.dart';
import 'package:shopywell/View/Widgets/bottombar.dart';
import 'package:shopywell/View/Widgets/mybutton.dart';
import 'package:shopywell/View/Widgets/mytextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthService _authService = FirebaseAuthService();

  GoogleSignInHelper googleSignInHelper = GoogleSignInHelper();

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Util().whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontFamily: "Montserrat Bold",
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Util().blackColor),
                  ),
                ),
                SizedBox(
                  height: screenH / 20,
                ),
                MyTextfield(
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: "Email",
                ),
                SizedBox(height: 20),
                MyTextfield(
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: "Password",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontFamily: "Montserrat Medium",
                              color: Util().primaeryColor),
                        )),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                MyButton(
                    text: "Login",
                    width: screenW,
                    height: 50,
                    onPressed: () {}),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    "- OR Continue with -",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Montserrat Medium"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFCF3F6),
                            shape: CircleBorder(
                                side: BorderSide(color: Util().primaeryColor)),
                            fixedSize: Size(40, 40)),
                        child: SvgPicture.asset(
                          "assets/svg/apple.svg",
                          // height: 35,
                          // width: 35,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    FilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            User? user =
                                await _authService.signInWithEmailAndPassword(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              context,
                            );

                            if (user != null) {
                              // Navigate to Home screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavBarScreen(),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFCF3F6),
                            shape: CircleBorder(
                                side: BorderSide(color: Util().primaeryColor)),
                            fixedSize: Size(40, 40)),
                        child: SvgPicture.asset(
                          "assets/svg/icons8-google.svg",
                          // height: 35,
                          // width: 35,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    FilledButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFCF3F6),
                            shape: CircleBorder(
                                side: BorderSide(color: Util().primaeryColor)),
                            fixedSize: Size(40, 40)),
                        child: SvgPicture.asset(
                          "assets/svg/facebook-app-symbol 1.svg",
                          height: 35,
                          width: 35,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SigntextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
