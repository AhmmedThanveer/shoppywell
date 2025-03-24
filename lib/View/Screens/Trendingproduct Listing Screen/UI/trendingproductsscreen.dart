import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopywell/View%20Model/Util/lists.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/appbar.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/searchbar.dart';
import 'package:shopywell/View/Screens/Profile%20Screen/UI/profilescreen.dart';
import 'package:shopywell/View/Screens/Trendingproduct%20Listing%20Screen/Widgets/trendingproductslistwidget.dart';

class TrendingProductsScreen extends StatelessWidget {
  const TrendingProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Util().whiteColor,
      appBar: CommonAppBar(
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        onProfilePressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarTile(),
            TrendingProductListWidget(screenW: screenW)
          ],
        ),
      ),
    );
  }
}
