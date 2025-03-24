import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/bottomnavprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View%20Model/Util/lists.dart';
import 'package:shopywell/View/Screens/Chekout%20Screen/UI/chekoutscreen.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavProvider>();

    return Scaffold(
      body: provider.showCheckout
          ? ChekoutScreen() // Show CheckoutScreen when FAB is clicked
          : screens[provider.selectedIndex], // Show normal bottom nav screens

      bottomNavigationBar: BottomAppBar(
        color: Util().whiteColor,
        elevation: 1,
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavItem(Icons.home, 'Home', 0, provider),
            buildNavItem(Icons.favorite_border, 'Wishlist', 1, provider),
            const SizedBox(width: 40), // Space for FAB
            buildNavItem(Icons.search, 'Search', 2, provider),
            buildNavItem(Icons.settings, 'Settings', 3, provider),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.toggleCheckoutScreen(); // Show Checkout Screen
        },
        backgroundColor:
            provider.showCheckout ? Util().primaeryColor : Util().whiteColor,
        shape: CircleBorder(),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: provider.showCheckout ? Util().whiteColor : Util().blackColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavItem(
      IconData icon, String label, int index, BottomNavProvider provider) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          provider.changeIndex(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: provider.selectedIndex == index
                  ? Util().primaeryColor
                  : Util().textColor,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: provider.selectedIndex == index
                    ? Util().primaeryColor
                    : Util().textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
