import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

// dyanmic listiel for passing tpe of icon and title you want
  Widget _buildListTile(
      {required String title, required IconData leadingIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: Icon(
            leadingIcon,
            color: Color.fromARGB(255, 49, 202, 169),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }

  // this getter returns stack widget and thier ifnormation only
  Widget get _stackInformationHolder => Stack(
        children: [
          Center(
            child: SizedBox(
              height: 100,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(image: AssetImage("images/prof.png")),
              ),
            ),
          ),
          Positioned(
              left: 190,
              bottom: -10,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 20,
                    color: Color.fromARGB(255, 49, 202, 169),
                  ),
                ),
              ))
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 202, 169),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 49, 202, 169),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.rosario(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            _stackInformationHolder,
            SizedBox(height: 6),
            Text("Seaph Abdulkdir Mohamed",
                style: GoogleFonts.rosario(color: Colors.white, fontSize: 24)),
            Text("Mr IT", style: GoogleFonts.rosario(color: Colors.white70)),
            const SizedBox(height: 35),
            SizedBox(
              height: 600,
              width: 600,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    _buildListTile(
                        title: "Edit Profile", leadingIcon: Icons.person),
                    _buildListTile(
                        title: "Setting", leadingIcon: Icons.settings),
                    _buildListTile(
                        title: "Invite Freinds", leadingIcon: Icons.person_add),
                    Divider(height: 3, color: Colors.grey.withOpacity(0.5)),
                    _buildListTile(title: "Help", leadingIcon: Icons.help),
                    _buildListTile(
                        title: "Logout", leadingIcon: Icons.login_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
