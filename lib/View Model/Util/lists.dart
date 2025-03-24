import 'package:flutter/material.dart';
import 'package:shopywell/View/Screens/Home%20Screen/UI/homescreen.dart';
import 'package:shopywell/View/Screens/Orders%20Screen/UI/ordersscreen.dart';
import 'package:shopywell/View/Screens/Profile%20Screen/UI/profilescreen.dart';
import 'package:shopywell/View/Screens/Settings%20Screen/UI/settingsscreen.dart';
import 'package:shopywell/View/Screens/Trendingproduct%20Listing%20Screen/UI/trendingproductsscreen.dart';
import 'package:shopywell/View/Screens/Trendingproduct%20Listing%20Screen/Widgets/trendingproductslistwidget.dart';

final List<Map<String, String>> onboardingData = [
  {
    "image": "assets/images/fashion shop-rafiki 1.png",
    "title": "Choose Products",
    "description":
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
  },
  {
    "image": "assets/images/Shopping bag-rafiki 1.png",
    "title": "Make Payment",
    "description": "Fast and secure payment options for a smooth checkout.",
  },
  {
    "image": "assets/images/Sales consulting-pana 1.png",
    "title": "Get Your Order",
    "description": "Stay updated on your orders with real-time tracking.",
  },
];
final List<Widget> screens = [
  HomeScreen(),
  // ProfileScreen(),
  TrendingProductsScreen(),
  OrdersScreen(),
  SettingsScreen(),
];
// List<FoodItem> foodShopItems() {
//   return [
//     FoodItem(
//         title: "Burger",
//         lb: "250g",
//         description: "Autumn And Winter Casual cotton-padded jacket...",
//         price: 5.99,
//         imageheight: 110,
//         imageUrl:
//             "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg",
//         bgColor: Colors.orange.shade100,
//         height: 240,
//         myItems: false),
//     FoodItem(
//         title: "Pizza",
//         lb: "500g",
//         imageheight: 160,
//         price: 9.99,
//         description: "Autumn And Winter Casual cotton-padded jacket...",
//         imageUrl:
//             "https://img.freepik.com/free-photo/flat-lay-natural-self-care-products-composition_23-2148990019.jpg",
//         bgColor: Colors.red.shade100,
//         height: 300,
//         myItems: true),
//     FoodItem(
//         title: "Pasta",
//         lb: "300g",
//         description: "Autumn And Winter Casual cotton-padded jacket...",
//         price: 7.99,
//         imageheight: 160,
//         imageUrl:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxZfYFiWuLVCLGpzhwMPUyK0FdtYxRunNqiZUPy8kVK9y6hxkMvAEWh5_MV6mcLCu1zJU&usqp=CAU",
//         bgColor: Colors.green.shade100,
//         height: 300,
//         myItems: false),
//     FoodItem(
//         title: "Burger",
//         lb: "250g",
//         description: "Autumn And Winter Casual cotton-padded jacket...",
//         price: 5.99,
//         imageheight: 110,
//         imageUrl:
//             "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg",
//         bgColor: Colors.orange.shade100,
//         height: 240,
//         myItems: false),
//     FoodItem(
//         title: "Pizza",
//         lb: "500g",
//         imageheight: 110,
//         price: 9.99,
//         description: "Autumn And Winter Casual cotton-padded jacket...",
//         imageUrl:
//             "https://img.freepik.com/free-photo/flat-lay-natural-self-care-products-composition_23-2148990019.jpg",
//         bgColor: Colors.red.shade100,
//         height: 240,
//         myItems: true),
//     FoodItem(
//         title: "Pasta",
//         lb: "300g",
//         description: "Autumn And Winter Casual cotton-padded jacket...",
//         price: 7.99,
//         imageheight: 160,
//         imageUrl:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxZfYFiWuLVCLGpzhwMPUyK0FdtYxRunNqiZUPy8kVK9y6hxkMvAEWh5_MV6mcLCu1zJU&usqp=CAU",
//         bgColor: Colors.green.shade100,
//         height: 300,
//         myItems: false),
//   ];
// }
final List<Map<String, String>> categories = [
  {'title': 'Beauty', 'image': 'assets/images/beautyitems.png'},
  {'title': 'Fashion', 'image': 'assets/images/girls.png'},
  {'title': 'Kids', 'image': 'assets/images/Kids.png'},
  {'title': 'Mens', 'image': 'assets/images/shirts.png'},
  {'title': 'Womens', 'image': 'assets/images/girls.png'},
];
final List<Map<String, dynamic>> products = [
  {
    "image":
        "https://rukminim2.flixcart.com/image/850/1000/xif0q/ethnic-set/m/u/9/s-chikan-kurta-htk-original-imagwgz8hjjynwg7.jpeg?q=90&crop=false",
    "name": "Women Printed Kurta",
    "description": "Neque porro quisquam est qui dolorem ipsum quia",
    "price": "₹1500",
    "original_price": "₹2499",
    "discount": "40% Off",
    "rating": 4.5,
    "reviews": "56,890"
  },
  {
    "image":
        "https://www.bunaai.com/cdn/shop/products/handpaintedindianwear-4949.jpg?v=1741246061",
    "name": "HRX by Hrithik Roshan",
    "description": "Neque porro quisquam est qui dolorem ipsum quia",
    "price": "₹2499",
    "original_price": "₹4999",
    "discount": "50% Off",
    "rating": 4.7,
    "reviews": "3,44,567"
  },
];
