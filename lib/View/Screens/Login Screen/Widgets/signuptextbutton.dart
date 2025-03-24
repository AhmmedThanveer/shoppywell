import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Register%20Screen/UI/registerscreen.dart';

class SigntextButton extends StatelessWidget {
  const SigntextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Create An Account  ', // First part in black
              style: TextStyle(
                  fontSize: 14,
                  color: Util().blackColor,
                  fontFamily: "Montserrat Regular"),
            ),
            TextSpan(
              text: 'Sign Up', // Second part in red
              style: TextStyle(
                color: Util().primaeryColor,
                fontFamily: "Montserrat Bold",
                // fontWeight: FontWeight.bold,
                decoration:
                    TextDecoration.underline, // Optional: underline "Sign Up"
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                  // Handle "Sign Up" click
                  print('Sign Up clicked!');
                  // Navigate to Sign Up screen or perform any other action
                },
            ),
          ],
        ),
      ),
    );
  }
}
