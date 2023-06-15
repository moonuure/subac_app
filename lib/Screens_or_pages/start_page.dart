import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

// my imports
import '../Screens_or_pages/Register_login_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[200],
            centerTitle: true,
            title: Text(
              "Creare Account",
              style: GoogleFonts.rosario(color: Colors.black, fontSize: 20),
            )),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Column(children: [
                  Image(image: AssetImage("images/logo.png")),
                  const SizedBox(height: 50),
                  Text(
                    "SUBAC APP",
                    style: GoogleFonts.montserratAlternates(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 80),
                  GestureDetector(
                      onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return RegisterLoginScreen();
                          })),
                      child: Container(
                          width: 200,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 34),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 49, 202, 169),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "GetStarted",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )),
                          )))
                ]))));
  }
}
