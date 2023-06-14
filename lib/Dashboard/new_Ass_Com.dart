import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAssemplyCompelete extends StatelessWidget {
  final String imagePath;
  final String cardName;

  NewAssemplyCompelete({required this.imagePath, required this.cardName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Card(
        elevation: 0,
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Image(
              image: AssetImage(imagePath),
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              cardName,
              style: GoogleFonts.rosario(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
