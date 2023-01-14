
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  Color top;
  RoundContainer({super.key, required this.top});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
         border: Border.all(color: Colors.white)
,        color: top,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}