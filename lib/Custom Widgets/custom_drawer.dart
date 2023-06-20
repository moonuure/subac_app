import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Divider(
            height: 3,
            color: Colors.grey.withOpacity(0.5),
          ),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: ListTile(
              leading: Icon(
                Icons.login,
                color: Color.fromARGB(255, 49, 202, 169),
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Color.fromARGB(255, 49, 202, 169),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
