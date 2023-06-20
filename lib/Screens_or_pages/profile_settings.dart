import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetting extends StatelessWidget {
  final Icon iconName;
  final Color colorsType;
  final String textName;
  ProfileSetting(
      {required this.iconName,
      required this.colorsType,
      required this.textName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade500,
        ),
        child: iconName,
      ),
      title: Text(
        textName,
        style: GoogleFonts.rosario(fontSize: 25, color: Colors.white),
      ),
      trailing: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: Colors.grey.shade500,
        ),
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
