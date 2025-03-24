import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shopywell/View%20Model/Provider/productprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
// import 'package:shopywell/View/Screens/Payment/payment_success_screen.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  Future<void> initiatePayment(BuildContext context, double amount) async {
    try {
      // Convert amount to cents
      int amountInCents = (amount * 100).toInt();

      // Create PaymentIntent
      final paymentIntent = await createPaymentIntent(amountInCents);

      // Initialize Stripe Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: "ShopyWell",
          style: ThemeMode.light,
        ),
      );

      // Show Payment Sheet
      await Stripe.instance.presentPaymentSheet();

      // On Successful Payment
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentSuccessScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment failed: $e")),
      );
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(int amount) async {
    final url = Uri.parse('https://api.stripe.com/v1/payment_intents');
    final response = await http.post(
      url,
      headers: {
        'Authorization':
            'Bearer sk_test_51R5xM6IhzN28iCXOexGcf026PZUsPUq4Qe4tkIj086XFQomNRXd4dfhS6TpmYlP9f7RaRKjUEVvbk2RQ2uwgPBvI009Tkfe5oM',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'amount': amount.toString(),
        'currency': 'usd',
      },
    );

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        final cartItems = productProvider.cartProducts;
        final totalAmount =
            cartItems.fold<double>(0, (sum, item) => sum + item.price);

        return cartItems.isEmpty
            ? const SizedBox.shrink()
            : Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border(
                      top:
                          BorderSide(color: Util().placehldrColor, width: 0.5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹ ${totalAmount.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat Bold",
                              color: Util().blackColor,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Details",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Montserrat Bold",
                                color: Util().primaeryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 220,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () =>
                              initiatePayment(context, totalAmount),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Util().primaeryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Text(
                            "Proceed to payment",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat Medium",
                              color: Util().whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
// import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 20),
            Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Thank you for your purchase.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
