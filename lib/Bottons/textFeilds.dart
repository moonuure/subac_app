import 'package:flutter/material.dart';

class textFeilds extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecire;

  textFeilds(
      {required this.controller,
      required this.hintText,
      required this.obsecire});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: TextField(
        controller: controller,
        obscureText: obsecire,
        decoration: InputDecoration(
            labelText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 49, 202, 169))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 49, 202, 169))),
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 30)),
      ),
    );
  }
}
