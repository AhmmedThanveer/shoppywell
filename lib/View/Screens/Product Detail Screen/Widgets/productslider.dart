import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/homebannerprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class ProductSlider extends StatefulWidget {
  final List<String> images;

  const ProductSlider({super.key, required this.images});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Consumer<Homesliderprovider>(
        builder: (context, homeSliderProvider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CarouselSlider.builder(
          carouselController: homeSliderProvider.carouselController,
          itemCount: widget.images.length,
          options: CarouselOptions(
            height: screenH / 4,
            enlargeCenterPage: false,
            autoPlay: false,
            initialPage: 0,
            aspectRatio: 3,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeSliderProvider.updateCurrentPage(index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.images[index]))),
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
            );
          },
        ),
      );
    });
  }
}
