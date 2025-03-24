import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Trendingproduct%20Listing%20Screen/UI/trendingproductsscreen.dart';

class DealoftheDayTile extends StatelessWidget {
  const DealoftheDayTile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Container(
        width: screenW,
        height: screenH / 10,
        decoration: BoxDecoration(
          color: Util().blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Deal of the Day",
                      style: TextStyle(
                        fontSize: 16,
                        color: Util().whiteColor,
                        fontFamily: "Montserrat Medium",
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Util().whiteColor,
                        ),
                        Text(
                          " 22h 55m 20s remaining ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Util().whiteColor,
                            fontFamily: "Montserrat Regular",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                FilledButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrendingProductsScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        // maximumSize: Size(120, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Util().whiteColor)),
                        backgroundColor: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View all",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Montserrat Bold",
                              color: Util().whiteColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward_outlined)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
