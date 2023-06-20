import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../Custom Widgets/container_icon_holder.dart';

class NewAssemblyScreen extends StatefulWidget {
  @override
  State<NewAssemblyScreen> createState() => _NewAssemblyState();
}

class _NewAssemblyState extends State<NewAssemblyScreen> {
  final List<String> listItems = ["Surah", "Hizb", "Juz"];
  String _selectedMenuItemValue = "Surah";
  int _selectedRadioButton = 0;

  // building for radioButton to use again and again
  Widget _buildRadioButton(
      {required String title, required int radioButtonValue}) {
    return Flexible(
      child: Transform.scale(
        scale: 1,
        child: RadioListTile(
            activeColor: Color.fromARGB(255, 49, 202, 169),
            value: radioButtonValue,
            groupValue: _selectedRadioButton,
            title: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onChanged: (indexOfSelectedRadio) {
              setState(() {
                _selectedRadioButton = indexOfSelectedRadio!;
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: BackButton(color: Color.fromARGB(255, 49, 202, 169)),
          backgroundColor: Colors.white,
          elevation: 2.0,
          title: Text(
            "New Assembly",
            style: GoogleFonts.rosario(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image(image: AssetImage("images/kitab.png")),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    _buildRadioButton(title: "By Surah", radioButtonValue: 0),
                    _buildRadioButton(title: "By Hizb", radioButtonValue: 1),
                    _buildRadioButton(title: "By Juz", radioButtonValue: 2),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              DropdownButton2<String>(
                barrierColor: Colors.transparent,
                alignment: AlignmentDirectional.center,
                buttonStyleData: ButtonStyleData(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 202, 169),
                    )),
                hint: Text("SlecteValue"),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
                items: listItems.map((String DropdwonMenuItemString) {
                  return DropdownMenuItem(
                    child: Text(DropdwonMenuItemString),
                    value: DropdwonMenuItemString,
                  );
                }).toList(),
                onChanged: (ValueOfTabbedMenuItem) {
                  setState(() {
                    _selectedMenuItemValue = ValueOfTabbedMenuItem!;
                  });
                },
                value: _selectedMenuItemValue,
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Who Begins",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 49, 202, 169),
                    ),
                    child: Center(
                      child: Text(
                        "AI",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Transform.scale(
                      scale: 2,
                      child: Switch.adaptive(
                          activeColor: Colors.red,
                          value: true,
                          onChanged: (value) {})),
                  SizedBox(width: 50),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 49, 202, 169),
                    ),
                    child: Center(
                      child: Text(
                        "Me",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Start",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 49, 202, 169),
                  fontStyle: FontStyle.italic,
                ),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerIconHolder(
                    containerBackground: Colors.red,
                    buttonBackgroundColor: Colors.white,
                    typeIcon: Icons.pause,
                  ),
                  ContainerIconHolder(
                    containerBackground: Color.fromARGB(255, 49, 202, 169),
                    buttonBackgroundColor: Colors.white,
                    typeIcon: Icons.stop,
                  ),
                  ContainerIconHolder(
                    containerBackground: Colors.yellow,
                    buttonBackgroundColor: Colors.white,
                    typeIcon: Icons.check,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
