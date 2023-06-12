import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Login/loginScreen.dart';
import '../Bottons/button.dart';
import '../Login/ragisterPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuranApp(),
  ));
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text(
          "Creare Account",
          style: GoogleFonts.rosario(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            children: [
              //Logo...........
              Image(image: AssetImage("images/logo.png")),
              //appName........
              SizedBox(
                height: 50,
              ),
              Text(
                "SUBAC APP",
                style: GoogleFonts.montserratAlternates(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              //App button......
              SizedBox(
                height: 40,
              ),
              MyButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RagisterPage()));
                },
                textOnButton: 'Create Acoount',
              ),

              // all ready have account text

              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "All ready have an account?",
                    style:
                        GoogleFonts.rosario(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.rosario(
                          color: Color.fromARGB(255, 56, 221, 144),
                          fontSize: 25),
                    ),
                  )
                ],
              ),
              

            ],

          ),
        ),
      ),
    );
  }
}
