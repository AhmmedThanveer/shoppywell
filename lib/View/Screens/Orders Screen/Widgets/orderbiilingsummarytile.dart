import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/productprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class OrderbiilingSummaryTile extends StatelessWidget {
  const OrderbiilingSummaryTile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
      final cartItems = productProvider.cartProducts;
      final totalAmount = cartItems.fold<double>(
          0, (sum, item) => sum + item.price); // Calculate total price

      return cartItems.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start/,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset("assets/svg/coupon_.svg"),
                      Text(
                        "Apply Coupons",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat Medium",
                          color: Util().blackColor,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Select",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat Bold",
                              color: Util().primaeryColor,
                            ),
                          ))
                    ],
                  ),
                  Divider(
                    color: Util().placehldrColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Order Payment Details",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Montserrat Medium",
                        color: Util().blackColor,
                        fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Amounts",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat Regular",
                            color: Util().blackColor,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "₹ ${totalAmount}",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat Bold",
                            color: Util().blackColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Convenience    ', // First part in black
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Util().blackColor,
                                  fontFamily: "Montserrat Regular"),
                            ),
                            TextSpan(
                              text: 'Know More', // Second part in red
                              style: TextStyle(
                                  color: Util().primaeryColor,
                                  fontFamily: "Montserrat Bold",
                                  fontSize: 10
                                  // fontWeight: FontWeight.bold,
                                  // decoration:
                                  //     TextDecoration.underline, // Optional: underline "Sign Up"
                                  ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Apply Coupons",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Montserrat Bold",
                              color: Util().primaeryColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat Regular",
                            color: Util().blackColor,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Montserrat Bold",
                            color: Util().primaeryColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Util().placehldrColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Total",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat Medium",
                            color: Util().blackColor,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "₹ ${totalAmount}",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat Bold",
                            color: Util().blackColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'EMI Available    ', // First part in black
                          style: TextStyle(
                              fontSize: 14,
                              color: Util().blackColor,
                              fontFamily: "Montserrat Regular"),
                        ),
                        TextSpan(
                          text: 'Details', // Second part in red
                          style: TextStyle(
                              color: Util().primaeryColor,
                              fontFamily: "Montserrat Bold",
                              fontSize: 10
                              // fontWeight: FontWeight.bold,
                              // decoration:
                              //     TextDecoration.underline, // Optional: underline "Sign Up"
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Util().placehldrColor,
                  )
                ],
              ),
            );
    });
  }
}
