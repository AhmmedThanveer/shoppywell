import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/authprovider.dart';
import 'package:shopywell/View%20Model/Provider/bottomnavprovider.dart';
import 'package:shopywell/View%20Model/Provider/homebannerprovider.dart';
import 'package:shopywell/View%20Model/Provider/onboardingprovider.dart';
import 'package:shopywell/View%20Model/Provider/passwordvisibiltyprovider.dart';
import 'package:shopywell/View%20Model/Provider/productprovider.dart';
import 'package:shopywell/View/Screens/Splash%20Screen/UI/splashscreen.dart';
import 'package:shopywell/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51R5xM6IhzN28iCXOG8JeHdFA3Rf2CElqvWL3uGh35bYoNiq5GUxVL42PJGYILg2E2U4HPbpHXeIrAJhFLY1eXMef008q7bGIll';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => Homesliderprovider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoppywell',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
