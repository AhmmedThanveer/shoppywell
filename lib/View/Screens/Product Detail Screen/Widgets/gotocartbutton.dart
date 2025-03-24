import 'package:flutter/material.dart';

class CommonGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final IconData icon;
  final List<Color> gradientColors;

  const CommonGradientButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.gradientColors = const [Color(0xFF3F92FF), Color(0xFF0B3689)],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 10, top: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    spreadRadius: 1,
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat Medium",
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: -35,
              top: -2.5,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage Example:
// CommonGradientButton(
//   onPressed: () { print("Navigating to cart"); },
//   buttonText: "Go to cart",
//   icon: Icons.shopping_cart,
//   gradientColors: [Color(0xFF3F92FF), Color(0xFF0B3689)],
// )
