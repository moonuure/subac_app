import 'package:flutter/material.dart';
import 'package:subac_app/Bottons/button.dart';
import '../Bottons/textFeilds.dart';
import '../Login/ragisterPage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            textFeilds(
                controller: usernameController,
                hintText: 'Email',
                obsecire: false),
            SizedBox(
              height: 60,
            ),
            textFeilds(
                controller: passwordController,
                hintText: 'Password',
                obsecire: true),
            SizedBox(
              height: 50,
            ),
            MyButton(
                textOnButton: "Login",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RagisterPage()));
                }),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To create new account?",
                  style: GoogleFonts.rosario(color: Colors.black, fontSize: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RagisterPage()));
                  },
                  child: Text(
                    "Ragister",
                    style: GoogleFonts.rosario(
                        color: Color.fromARGB(255, 56, 221, 144), fontSize: 25),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
