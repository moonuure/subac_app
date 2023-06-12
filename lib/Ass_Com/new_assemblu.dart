import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class NewAssembly extends StatefulWidget {
  NewAssembly({super.key});

  @override
  State<NewAssembly> createState() => _NewAssemblyState();
}

class _NewAssemblyState extends State<NewAssembly> {
  String? groupValue;
  final List<String> listItems = ["Surah", "Hizb", "Juz"];
  String selectedVal = "Select One";
  int index = 0;

  dropDownState() {
    selectedVal = listItems[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Text(
          "New Assembly",
          style: GoogleFonts.rosario(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image(image: AssetImage("images/kitab.png")),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Radio(
                      activeColor: Color.fromARGB(255, 49, 202, 169),
                      value: "By Surah",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          this.groupValue = value.toString();
                        });
                      }),
                  Text(
                    "By Surah",
                    style:
                        GoogleFonts.rosario(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Radio(
                      activeColor: Color.fromARGB(255, 49, 202, 169),
                      value: "By Hizb",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          this.groupValue = value.toString();
                        });
                      }),
                  Text(
                    "By Hizb",
                    style:
                        GoogleFonts.rosario(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Radio(
                      activeColor: Color.fromARGB(255, 49, 202, 169),
                      value: "Bu Juz",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          this.groupValue = value.toString();
                        });
                      }),
                  Text(
                    "By Jiz",
                    style:
                        GoogleFonts.rosario(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              DropdownButton2<String>(
                hint: Text("Select One"),
                items: listItems.map((e) {
                  // print(e);
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                value: listItems[index],
                onChanged: (value) {
                  setState(() {
                    selectedVal = value.toString();
                  });
                },
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Color.fromARGB(255, 49, 202, 169),
                  iconDisabledColor: Colors.red.shade500,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color.fromARGB(255, 49, 202, 169),
                  ),
                  elevation: 8,
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
