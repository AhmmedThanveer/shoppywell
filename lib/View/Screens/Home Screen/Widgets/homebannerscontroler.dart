import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/homebannerprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class HomeBannersControler extends StatefulWidget {
  const HomeBannersControler({super.key});

  @override
  State<HomeBannersControler> createState() => _HomeBannersControlerState();
}

class _HomeBannersControlerState extends State<HomeBannersControler> {
  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Consumer<Homesliderprovider>(
        builder: (context, homeSliderProvider, _) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                homeSliderProvider.carouselController.animateToPage(index);
              },
              child: Container(
                width: index == homeSliderProvider.currentPage ? 10.0 : 8,
                height: index == homeSliderProvider.currentPage ? 10.0 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(10),
                  color: index == homeSliderProvider.currentPage
                      ? Color(0xFFFFA3B3)
                      : Colors.grey.withOpacity(0.8),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
