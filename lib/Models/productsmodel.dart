import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String subtitle;
  final double price;
  final double discountPrice;
  final List<String> images;
  final double reviewRate;
  final int ratingCount;
  final String category;
  final int height;
  final int imageHeight;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.subtitle,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewRate,
    required this.ratingCount,
    required this.category,
    required this.height,
    required this.imageHeight,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      name: data['productname'] ?? '',
      description: data['Description'] ?? '',
      subtitle: data['subtitle'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      discountPrice: (data['Discountprice'] ?? 0).toDouble(),
      images: List<String>.from(data['Images'] ?? []),
      reviewRate: (data['Reviewsrate'] ?? 0).toDouble(),
      ratingCount: data['ratingCount'] ?? 0,
      category: data['Category'] ?? '',
      height: data['Height'] ?? 0,
      imageHeight: data['ImageHeght'] ?? 0,
    );
  }
}
