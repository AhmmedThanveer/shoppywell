import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/productprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Chekout%20Screen/UI/chekoutscreen.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/Widgets/deliverytile.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/Widgets/gotocartbutton.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/Widgets/productcontroler.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/Widgets/productslider.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/Widgets/ratingbar.dart';
import 'package:shopywell/View/Widgets/myappbar.dart';

class ProductDetailScreen extends StatelessWidget {
  final product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Util().whiteColor,
      appBar: CustomAppBar(
        title: "",
        actionWidget: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leadingWidget: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(images: product.images),
              ProductControler(images: product.images),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 18, fontFamily: "Montserrat Bold"),
              ),
              const SizedBox(height: 10),
              Text(
                "${product.category}",
                style: const TextStyle(
                    fontSize: 13, fontFamily: "Montserrat Bold"),
              ),
              const SizedBox(height: 5),
              Text(
                product.subtitle,
                style: const TextStyle(
                    fontSize: 13, fontFamily: "Montserrat Regular"),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Price: \₹ ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Util().blackColor,
                          fontFamily: "Montserrat Medium"),
                    ),
                    TextSpan(
                      text: '${product.discountPrice}',
                      style: TextStyle(
                          color: Util().blackColor,
                          fontFamily: "Montserrat Medium",
                          decoration: TextDecoration.lineThrough,
                          fontSize: 15),
                    ),
                    TextSpan(
                      text: '  ${product.price} ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Util().blackColor,
                          fontFamily: "Montserrat Medium"),
                    ),
                    TextSpan(
                      text: '  50% Off',
                      style: TextStyle(
                          fontSize: 14,
                          color: Util().primaeryColor,
                          fontFamily: "Montserrat Bold"),
                    ),
                  ],
                ),
              ),
              RatingBar(ratingcount: product.reviewRate),
              const SizedBox(height: 10),
              Text(
                "Product Details",
                style: const TextStyle(
                    fontSize: 16, fontFamily: "Montserrat Medium"),
              ),
              Text(
                product.description,
                style: const TextStyle(
                    fontSize: 12, fontFamily: "Montserrat Regular"),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CommonGradientButton(
                    onPressed: () {
                      productProvider.addToCart(product); // Add to cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added to Cart")),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChekoutScreen(),
                          ));
                    },
                    buttonText: "Go To Cart",
                    icon: Icons.shopping_cart_outlined,
                    gradientColors: [Color(0xFF3F92FF), Color(0xFF0B3689)],
                  ),
                  CommonGradientButton(
                    onPressed: () {},
                    buttonText: "Buy Now",
                    icon: Icons.pinch_outlined,
                    gradientColors: [
                      Color(0xFF71F9A9),
                      Color(0xFF31B769),
                    ],
                  ),
                ],
              ),
              DeliveryTile(),
            ],
          ),
        ),
      ),
    );
  }
}
