import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/productprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Orders%20Screen/UI/ordersscreen.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/Widgets/ratingbar.dart';
import 'package:shopywell/View/Widgets/mybutton.dart';

class ShoppingProductsList extends StatelessWidget {
  const ShoppingProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        final cartItems = productProvider.cartProducts;
        final totalAmount = cartItems.fold<double>(
            0, (sum, item) => sum + item.price); // Calculate total price

        return cartItems.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text("No items in the checkout"),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, top: 20, bottom: 10, right: 20),
                    child: Text(
                      "Shopping List",
                      style: TextStyle(
                          fontFamily: "Montserrat Bold", fontSize: 16),
                    ),
                  ),
                  ListView.builder(
                    itemCount: cartItems.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Product Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product.images.first,
                                      width: 150,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Product Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontFamily: "Montserrat Bold",
                                            fontSize: 14,
                                          ),
                                        ),
                                        RatingBar(
                                            ratingcount: product.reviewRate),
                                        const SizedBox(height: 4),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color:
                                                          Util().borderColor)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "\$ ${product.price}",
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        "Montserrat Medium",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "\$ ${product.discountPrice}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "Montserrat Medium",
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "upto 33% off",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily:
                                                        "Montserrat Regular",
                                                    color: Util().primaeryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Order (1) :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Montserrat Medium",
                                    ),
                                  ),
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Montserrat Bold",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 20, bottom: 10),
                    child: MyButton(
                      text: "Proceed",
                      width: double.infinity,
                      height: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrdersScreen()),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
