import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/passwordvisibiltyprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.prefixIcon,
    this.validator, // Not mandatory
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityProvider>(
      builder: (context, visibilityProvider, child) {
        return TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText:
              isPassword ? !visibilityProvider.isPasswordVisible : false,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Util().bgColor, // Set background color to #A8A8A9
            hintStyle: const TextStyle(
              fontFamily: "Montserrat Medium",
              fontSize: 13,
              color: Color(0xFF626262),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  BorderSide(color: Util().bordrColor), // Default border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Util().placehldrColor), // Border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Util().placehldrColor, width: 2.0), // Focused border
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red), // Error border
            ),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: const Color(0xFF626262))
                : null,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      visibilityProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xFF626262),
                    ),
                    onPressed: () {
                      visibilityProvider.toggleVisibility();
                    },
                  )
                : null,
          ),
          validator: validator,
        );
      },
    );
  }
}
