import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/homebannerprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class RatingBar extends StatefulWidget {
  final double ratingcount;
  const RatingBar({super.key, required this.ratingcount});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Homesliderprovider>(
        builder: (context, homeSliderProvider, _) {
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(widget.ratingcount.toInt(), (index) {
            return SvgPicture.asset("assets/svg/star.svg");
          }),
        ),
      );
    });
  }
}
