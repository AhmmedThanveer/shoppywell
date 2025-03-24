import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/homebannerprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class ProductControler extends StatefulWidget {
  final List<String> images;
  const ProductControler({super.key, required this.images});

  @override
  State<ProductControler> createState() => _ProductControlerState();
}

class _ProductControlerState extends State<ProductControler> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Homesliderprovider>(
        builder: (context, homeSliderProvider, _) {
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
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
                      ? Util().primaeryColor
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
