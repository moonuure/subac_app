import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Bottons/textFeilds.dart';
import '../Bottons/button.dart';
import '../Bottons/phonFeild.dart';
import '../Dashboard/dashBoard.dart';

class RagisterPage extends StatelessWidget {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneControler = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Creat Acoount",
            style: GoogleFonts.rosario(color: Colors.black, fontSize: 25),
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            textFeilds(
                controller: nameController, hintText: 'Name', obsecire: false),
            SizedBox(
              height: 50,
            ),
            textFeilds(
                controller: usernameController,
                hintText: 'Email',
                obsecire: false),
            SizedBox(
              height: 50,
            ),
            PhoneFeild(
              controller: phoneControler,
              textLabel: "Phone Number",
              obsecire: false,
            ),
            SizedBox(
              height: 30,
            ),
            textFeilds(
                controller: passwordController,
                hintText: 'Password',
                obsecire: true),
            SizedBox(
              height: 50,
            ),
            MyButton(
                textOnButton: "Create Account",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By continuing, you’re agreeing to our \n customer terms of service privacy \n policy and cookie policy. ",
                  style: GoogleFonts.rosario(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
