import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View%20Model/Util/lists.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Util().whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
            child: Image.network(
              product["image"],
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["name"],
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat Medium",
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  product["description"],
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat Regular",
                      color: Util().placehldrColor),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      product["price"],
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat Bold",
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      product["original_price"],
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Montserrat Regular",
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(width: 5),
                    Text(
                      product["discount"],
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Montserrat Medium",
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(
                      " ${product["rating"]}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat Regular",
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      product["reviews"],
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Montserrat Medium",
                          color: Util().placehldrColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
