import 'package:flutter/material.dart';

class containerData extends StatelessWidget {
   containerData(
      {this.cardContent, required this.containerCOLOR,  this.onPress});
  final Widget? cardContent;
  final Color containerCOLOR;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: containerCOLOR,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: cardContent,
      ),
    );
  }
}
