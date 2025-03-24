import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLeadingPressed;
  final VoidCallback onProfilePressed;

  // Constructor
  CommonAppBar({
    required this.onLeadingPressed,
    required this.onProfilePressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent, // Customize the background color
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          style: ElevatedButton.styleFrom(
            iconSize: 30,
            fixedSize: Size(30, 30),
            backgroundColor: Color(0xFFF2F2F2),
            padding: EdgeInsets.only(),
            shape: CircleBorder(
                side: BorderSide(
              color: Color(0xFFF2F2F2),
            )),
          ),
          icon: Icon(Icons.menu), // Replace with your desired leading icon
          onPressed: onLeadingPressed,
        ),
      ),
      title: Center(
        child: Image.asset(
          'assets/images/POS-LOGO 2.png', // Your asset image
          height: 40, // Set height to make it fit the app bar
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/user.png'), // Your profile image
            ),
            onPressed: onProfilePressed,
          ),
        ),
      ],
    );
  }
}
