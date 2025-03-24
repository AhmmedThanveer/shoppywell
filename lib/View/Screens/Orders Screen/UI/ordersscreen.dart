import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Orders%20Screen/Widgets/bottompaymentbutton.dart';
import 'package:shopywell/View/Screens/Orders%20Screen/Widgets/carttile.dart';
import 'package:shopywell/View/Screens/Orders%20Screen/Widgets/orderbiilingsummarytile.dart';
import 'package:shopywell/View/Widgets/myappbar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Shopping Bag",
        isNeedLeading: true,
        actionWidget: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 0),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          )
        ],
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
          children: [CartTile(), OrderbiilingSummaryTile()],
        ),
      ),
      bottomNavigationBar: PaymentButton(),
    );
  }
}
