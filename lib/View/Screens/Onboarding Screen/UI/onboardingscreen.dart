import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/onboardingprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View%20Model/Util/lists.dart';
import 'package:shopywell/View/Screens/Onboarding%20Screen/Widgets/appbar.dart';
import 'package:shopywell/View/Screens/Onboarding%20Screen/Widgets/navigationbuttons.dart';
import 'package:shopywell/View/Screens/Onboarding%20Screen/Widgets/onboardingcontentwidget.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();
  final VoidCallback onFinish;

  OnboardingScreen({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: OnboardingAppBar(
        totalPages: onboardingData.length,
        onSkip: onFinish,
      ),
      backgroundColor: Util().whiteColor,
      body: Consumer<OnboardingProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  allowImplicitScrolling: true,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    provider.setPage(index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingContent(
                      image: onboardingData[index]["image"]!,
                      title: onboardingData[index]["title"]!,
                      description: onboardingData[index]["description"]!,
                    );
                  },
                ),
              ),
              NavigationButtons(controller: _controller, onFinish: onFinish),
            ],
          );
        },
      ),
    );
  }
}
