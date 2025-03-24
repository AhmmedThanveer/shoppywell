import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/productprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Product%20Detail%20Screen/UI/productdetailscreen.dart';
// import '../providers/product_provider.dart';

class TrendingProductListWidget extends StatefulWidget {
  final double screenW;

  const TrendingProductListWidget({super.key, required this.screenW});

  @override
  State<TrendingProductListWidget> createState() =>
      _TrendingProductListWidgetState();
}

class _TrendingProductListWidgetState extends State<TrendingProductListWidget> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return productProvider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: productProvider.products.isEmpty
                ? const Center(child: Text("No Products Available"))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${productProvider.products.length}+ Items",
                                style: TextStyle(
                                    fontFamily: "Montserrat Bold",
                                    fontSize: 18),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 5,
                                            top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Sort",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    "Montserrat Regular",
                                              ),
                                            ),
                                            Icon(Icons.swap_vert)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 5,
                                            top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Filter",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    "Montserrat Regular",
                                              ),
                                            ),
                                            Icon(Icons.filter_alt_outlined)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        MasonryGridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: productProvider.products.length,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            final product = productProvider.products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      product: product,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: product.height.toDouble(),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: product.imageHeight.toDouble(),
                                      width: widget.screenW,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              product.images.first),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        product.name,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Montserrat Medium",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5, right: 10),
                                      child: Text(
                                        product.description,
                                        maxLines: 3,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Montserrat Regular",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        "\$${product.price}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Montserrat Medium",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ]),
          );
  }
}
