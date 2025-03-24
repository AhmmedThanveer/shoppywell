import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/homebannerprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class HomeBanners extends StatefulWidget {
  const HomeBanners({super.key});

  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
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
          itemCount: 3,
          options: CarouselOptions(
            height: screenH / 4,
            enlargeCenterPage: false,
            autoPlay: true,
            initialPage: 0,
            aspectRatio: 3,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeSliderProvider.updateCurrentPage(index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/beauty.png"))),
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "50-40% OFF",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Montserrat Bold",
                              color: Util().whiteColor),
                        ),
                        Text(
                          "Now in (product)\nAll colours",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat Regular",
                              color: Util().whiteColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        FilledButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                maximumSize: Size(141, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Util().whiteColor)),
                                backgroundColor: Colors.transparent),
                            child: Row(
                              children: [
                                Text(
                                  "Shop Now",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Montserrat Bold",
                                      color: Util().whiteColor),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.arrow_forward_outlined)
                              ],
                            ))
                      ],
                    ),
                  )),
            );
          },
        ),
      );
    });
  }
}
