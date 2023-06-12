import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneFeild extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final controller;
  final String textLabel;
  final bool obsecire;

  PhoneFeild(
      {required this.controller,
      required this.textLabel,
      required this.obsecire});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntlPhoneField(
                obscureText: obsecire,
                controller: controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 202, 169))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 202, 169))),
                    labelText: textLabel,
                    labelStyle: TextStyle(fontSize: 25, color: Colors.grey),
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
            ],
          )),
    );
  }
}
