import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.incDec, required this.onPressed});

  final IconData incDec;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      // () {
      //   incDec == Icons.add ? weight++ : weight--;
      //   },
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minHeight: 59, minWidth: 59),

      child: Icon(
        incDec,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}