import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/onboardingprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int totalPages;
  final VoidCallback onSkip;

  const OnboardingAppBar({
    super.key,
    required this.totalPages,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // centerTitle: true,
      title: Consumer<OnboardingProvider>(
        builder: (context, provider, child) {
          return Text(
            '${provider.currentPage + 1}/$totalPages',
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: Util().textColor,
              fontFamily: "Montserrat Bold",
            ),
          );
        },
      ),
      actions: [
        Consumer<OnboardingProvider>(
          builder: (context, provider, child) {
            return Visibility(
              visible: provider.currentPage < totalPages - 1,
              child: TextButton(
                onPressed: onSkip,
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Util().textColor,
                    fontSize: 16,
                    fontFamily: "Montserrat Bold",
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
