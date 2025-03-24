import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 230,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Util().blackColor,
                fontFamily: "Montserrat Bold"),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat Medium",
              color: Util().placehldrColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
