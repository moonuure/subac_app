import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Custom Widgets/custom_drawer.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            color: Colors.grey.withOpacity(0.30),
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
              width: 100,
              child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(100),
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("userinformation")
                          .where("userid",
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .get(),
                      builder: (_, getData) {
                        if (getData.connectionState == ConnectionState.waiting)
                          return Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 214, 215, 215)),
                            ),
                          );

                        return Image.network(
                            getData.data!.docs[0].data()["profile_url"]);
                      })),
            ),
          ),
          Positioned(
              left: 210,
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
    return Container(
      color: Color.fromARGB(255, 49, 202, 169),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            _stackInformationHolder,
            SizedBox(height: 6),
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("userinformation")
                    .where("userid",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (_, getData) {
                  if (getData.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 214, 215, 215)),
                    );

                  return Text(getData.data!.docs[0].data()["name"],
                      style: GoogleFonts.firaCode().copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ));
                  ;
                }),
            Text("Mr IT", style: GoogleFonts.rosario(color: Colors.white70)),
            const SizedBox(height: 35),
            SizedBox(
              height: 600,
              width: 620,
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
                      title: "Logout",
                      leadingIcon: Icons.login_outlined,
                    ),
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
