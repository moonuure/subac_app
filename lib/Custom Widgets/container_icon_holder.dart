import 'package:flutter/material.dart';

class ContainerIconHolder extends StatelessWidget {
  final Color buttonBackgroundColor;
  final IconData typeIcon;
  final Color containerBackground;

  ContainerIconHolder({
    required this.buttonBackgroundColor,
    required this.containerBackground,
    required this.typeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerBackground,
      ),
      child: Icon(
        typeIcon,
        color: buttonBackgroundColor,
      ),
    );
  }
}
