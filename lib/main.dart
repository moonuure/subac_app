import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:subac_app/Dashboard/dashBoard.dart';
import 'package:subac_app/Screens_or_pages/Register_login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
    QuranApp(),
  );
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator(
                  color: Color.fromARGB(255, 49, 202, 169));

            if (snapshots.hasData) return DashBoard();
            return RegisterLoginScreen();
          },
        ));
  }
}
