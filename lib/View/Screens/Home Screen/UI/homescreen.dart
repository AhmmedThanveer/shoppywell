import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/appbar.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/catogoriestile.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/dealofthedaytile.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/homebanners.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/homebannerscontroler.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/productstile.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/searchbar.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/specialoffertile.dart';
import 'package:shopywell/View/Screens/Home%20Screen/Widgets/trendingtile.dart';
import 'package:shopywell/View/Screens/Profile%20Screen/UI/profilescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CommonAppBar(
          onLeadingPressed: () {},
          onProfilePressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ));
          },
        ),
        backgroundColor: Util().whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarTile(),
              CategoriesTile(),
              HomeBanners(),
              HomeBannersControler(),
              DealoftheDayTile(),
              ProductsTile(),
              SpecialOfferTile(),
              TrendingProductsTile()
            ],
          ),
        ));
  }
}
