import 'package:bmi_calculator_am/constants.dart';
import 'package:flutter/material.dart';

class InsideContainers extends StatelessWidget {
  InsideContainers({required this.genderName, required this.icons});
  final IconData icons;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons, size: 80, color: Colors.white),
          Text(
            genderName,
            style: kTextStyle,
          ),
        ],
      ),
    );
  }
}
