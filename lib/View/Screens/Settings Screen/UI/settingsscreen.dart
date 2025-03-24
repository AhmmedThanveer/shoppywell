import 'package:flutter/material.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util().bgColor,
      body: Center(child: Text("settings")),
    );
  }
}
