import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class SearchBarTile extends StatelessWidget {
  const SearchBarTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search any Product..",
            // hintTextDirection: TextDirection.ltr,
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            hintStyle: TextStyle(
                color: Util().placehldrColor,
                fontFamily: "Montserrat Regular",
                fontSize: 14),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Util().placehldrColor),
            suffixIcon:
                Icon(Icons.mic_none_sharp, color: Util().placehldrColor),
          ),
        ),
      ),
    );
  }
}
