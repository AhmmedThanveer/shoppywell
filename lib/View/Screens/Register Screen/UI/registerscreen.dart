import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopywell/View%20Model/Firebase/firestore_collection.dart';
import 'package:shopywell/View%20Model/Firebase/google_signin.dart';
import 'package:shopywell/View%20Model/Helper/sharedprefrencehelper.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Forgot%20Password%20Screen/UI/forgotpasswordscreen.dart';
import 'package:shopywell/View/Screens/Home%20Screen/UI/homescreen.dart';
import 'package:shopywell/View/Screens/Register%20Screen/Widgets/signintxtbutton.dart';
import 'package:shopywell/View/Widgets/bottombar.dart';
import 'package:shopywell/View/Widgets/mybutton.dart';
import 'package:shopywell/View/Widgets/mytextfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confrmpasswordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GoogleSignInHelper googleSignInHelper = GoogleSignInHelper();

    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Util().whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, right: 30, left: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontFamily: "Montserrat Bold",
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Util().blackColor),
                  ),
                ),
                SizedBox(
                  height: screenH / 25,
                ),
                MyTextfield(
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.person_2,
                  controller: emailControler,
                  hintText: "Username or Email",
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
                ),
                SizedBox(height: 20),
                MyTextfield(
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  controller: passwordControler,
                  hintText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                MyTextfield(
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  controller: confrmpasswordControler,
                  hintText: "Confirm Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password cannot be empty';
                    }
                    if (value != passwordControler.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
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
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking the ', // First part in black
                        style: TextStyle(
                            fontSize: 13,
                            color: Util().blackColor,
                            fontFamily: "Montserrat Regular"),
                      ),
                      TextSpan(
                        text: 'Register', // Second part in red
                        style: TextStyle(
                            color: Util().primaeryColor,
                            fontFamily: "Montserrat Regular",
                            fontSize: 13
                            // fontWeight: FontWeight.bold,
                            // decoration:
                            //     TextDecoration.underline, // Optional: underline "Sign Up"
                            ),
                      ),
                      TextSpan(
                        text:
                            ' button, you agree to the public offer', // First part in black
                        style: TextStyle(
                            fontSize: 13,
                            color: Util().blackColor,
                            fontFamily: "Montserrat Regular"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                    text: "Create Account",
                    width: screenW,
                    height: 50,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );

                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: emailControler.text.trim(),
                            password: passwordControler.text.trim(),
                          );

                          await FirestoreServices.saveUser(
                            emailControler.text.trim(),
                            passwordControler.text.trim(),
                          );

                          final token = await FirebaseAuth.instance.currentUser!
                              .getIdToken();
                          Sharedpreferencehelper().setFirebaseAuthToken(token!);

                          // Close loading dialog
                          Navigator.pop(context);

                          // Show success Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Registration Successful!"),
                              backgroundColor: Colors.green,
                            ),
                          );

                          print(
                              "User registered successfully: ${userCredential.user?.email}");

                          // Navigate to home screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavBarScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          Navigator.pop(
                              context); // Close loading dialog if an error occurs
                          print("Error during registration: ${e.message}");

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.message ?? "Registration failed"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    }),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "- OR Continue with -",
                    style: TextStyle(fontFamily: "Montserrat Medium"),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                          final UserCredential? userCredential =
                              await googleSignInHelper
                                  .signInWithGoogle(context);

                          if (userCredential != null) {
                            // Show success message and navigate to Home screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Google Sign-In Successful!"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Navigate to Home screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBarScreen(),
                              ),
                            );
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
                SignIntextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
