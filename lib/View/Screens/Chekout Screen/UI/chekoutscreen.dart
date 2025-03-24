import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Chekout%20Screen/Widgets/deliveryaddresstile.dart';
import 'package:shopywell/View/Screens/Chekout%20Screen/Widgets/shoppingproductslist.dart';
import 'package:shopywell/View/Widgets/myappbar.dart';

class ChekoutScreen extends StatelessWidget {
  const ChekoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Checkout",
        isNeedLeading: true,
        actionWidget: [],
        leadingWidget: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      backgroundColor: Util().whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DeliveryAddressTile(),
            ShoppingProductsList(),
          ],
        ),
      ),
    );
  }
}
