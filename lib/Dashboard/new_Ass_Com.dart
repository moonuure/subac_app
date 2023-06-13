import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAssemplyCompelete extends StatelessWidget {
  final String imagePath;

  NewAssemplyCompelete({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade300,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Image(
            image: AssetImage(imagePath),
            height: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Complete",
            style: GoogleFonts.rosario(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
