import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Color(0xFFFFA3B3)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery in",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat Medium",
                  // fontWeight: FontWeight.bold,
                  color: Util().blackColor,
                ),
              ),
              Text(
                "1 within Hour",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat Bold",
                  color: Util().blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
