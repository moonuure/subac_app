import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Custom Widgets/container_icon_holder.dart';

class CompeleteTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Complete",
          style: TextStyle(color: Color.fromARGB(255, 49, 202, 169)),
        ),
        elevation: 0,
        leading: BackButton(color: Color.fromARGB(255, 49, 202, 169)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 400,
            child: Image.asset("images/comp.png"),
          ),
          Text(
            "Resume",
            style: GoogleFonts.jetBrainsMono().copyWith(
                fontStyle: FontStyle.italic,
                fontSize: 30,
                color: Color.fromARGB(255, 49, 202, 169)),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 49, 202, 169),
              ),
              child: Center(child: Text("Audio will be here ")),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ContainerIconHolder(
              containerBackground: Colors.red,
              buttonBackgroundColor: Colors.white,
              typeIcon: Icons.pause,
            ),
              
              SizedBox(width: 50),
            ContainerIconHolder(
              containerBackground: Color.fromARGB(255, 49, 202, 169),
              buttonBackgroundColor: Colors.white,
              typeIcon: Icons.stop,
            ),
          ]
              ),
            ],
          ),
       
    );
  }
}
