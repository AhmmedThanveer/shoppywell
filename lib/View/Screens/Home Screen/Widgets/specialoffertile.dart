import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class SpecialOfferTile extends StatelessWidget {
  const SpecialOfferTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/Rectangle 56.png"),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Special Offers  😱",
              style: TextStyle(
                  fontFamily: "Montserrat Medium",
                  color: Util().blackColor,
                  fontSize: 16),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "We make sure you get the offer you need at best prices",
              style: TextStyle(
                  fontFamily: "Montserrat Regular",
                  color: Util().placehldrColor,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
