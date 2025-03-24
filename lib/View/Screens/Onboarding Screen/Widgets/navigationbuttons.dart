import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/onboardingprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class NavigationButtons extends StatelessWidget {
  final PageController controller;
  final VoidCallback onFinish;

  const NavigationButtons(
      {super.key, required this.controller, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: provider.currentPage == 0
                    ? null
                    : () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                child: Text(
                  "Prev",
                  style: TextStyle(
                    fontFamily: "Montserrat Bold",
                    color: Util().placehldrColor,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: provider.currentPage == index ? 30 : 14,
                    height: 8,
                    decoration: BoxDecoration(
                      color: provider.currentPage == index
                          ? Util().textColor
                          : Util().placehldrColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: provider.currentPage == 2
                    ? onFinish
                    : () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                child: Text(
                  provider.currentPage == 2 ? "Finish" : "Next",
                  style: TextStyle(
                    fontFamily: "Montserrat Bold",
                    color: Util().primaeryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
