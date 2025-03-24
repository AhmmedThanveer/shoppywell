import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Widgets/mybutton.dart';
import 'package:shopywell/View/Widgets/mytextfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameControler = TextEditingController();
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Util().whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                "Forgot password?",
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
                prefixIcon: Icons.email_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  return null;
                },
                controller: userNameControler,
                hintText: "Enter your email address"),
            SizedBox(
              height: 40,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '* ', // First part in black
                    style: TextStyle(
                        fontSize: 13,
                        color: Util().primaeryColor,
                        fontFamily: "Montserrat Regular"),
                  ),
                  TextSpan(
                    text:
                        ' We will send you a message to set or reset your new password', // First part in black
                    style: TextStyle(
                        fontSize: 13,
                        color: Util().blackColor,
                        fontFamily: "Montserrat Regular"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MyButton(
                text: "Submit", width: screenW, height: 50, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
