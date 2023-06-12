import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Pages/profile_settings.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 202, 169),
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 4,
        backgroundColor: Color.fromARGB(255, 49, 202, 169),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.rosario(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(image: AssetImage("images/prof.png")),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Profile Name",
                  style:
                      GoogleFonts.rosario(color: Colors.white, fontSize: 24)),
              Text("NickName", style: GoogleFonts.rosario(color: Colors.grey)),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "edit profile",
                    style: GoogleFonts.rosario(
                      fontSize: 20,
                      color: Colors.green.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 5,
                color: Colors.white,
                thickness: 1.5,
              ),
              SizedBox(
                height: 22,
              ),
              ProfileSetting(
                iconName: Icon(Icons.settings),
                colorsType: Colors.white,
                textName: "Setting",
              ),
              SizedBox(
                height: 22,
              ),
              ProfileSetting(
                iconName: Icon(Icons.share),
                colorsType: Colors.white,
                textName: "invite-freinds",
              ),
              SizedBox(
                height: 22,
              ),
              ProfileSetting(
                iconName: Icon(Icons.help_center_outlined),
                colorsType: Colors.white,
                textName: "Help",
              ),
              SizedBox(
                height: 22,
              ),
              Divider(
                height: 5,
                color: Colors.white,
                thickness: 1.5,
              ),
              SizedBox(
                height: 35,
              ),
              ProfileSetting(
                iconName: Icon(Icons.logout_outlined),
                colorsType: Colors.white,
                textName: "Logout",
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.only(top: 25, left: 130, right: 150),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 115,
      //         width: 115,
      //         child: Stack(
      //           fit: StackFit.expand,
      //           children: [
      //             CircleAvatar(
      //               backgroundImage: AssetImage("images/prof.png"),
      //             ),
      //             Positioned(
      //               right: -12,
      //               bottom: 0,
      //               child: SizedBox(
      //                 height: 46,
      //                 width: 46,
      //                 child: IconButton(
      //                     color: Colors.white,
      //                     onPressed: null,
      //                     icon: Icon(
      //                       color: Color.fromARGB(255, 255, 255, 255),
      //                       Icons.camera_alt_outlined,
      //                     )),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         "Bushra Mohamed Axmed",
      //         style: GoogleFonts.rosario(color: Colors.white),
      //       ),
      //       SizedBox(
      //         height: 25,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
