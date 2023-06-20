import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Custom Widgets/custom_drawer.dart';
import '../Custom Widgets/home.dart';
import '../Screens_or_pages/user_profile.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final _pages = [HomeWidget(), HomeWidget(), Profile()];
  int _selectedPage = 0;

// this is function will index any index taht is tapped
  _setIndexToSelectedPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 202, 169),
        title: Text(_selectedPage == 2 ? "Profile" : "Home"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: _pages[_selectedPage],
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          onTap: _setIndexToSelectedPage,
          backgroundColor: Colors.transparent,
          color: Colors.grey.shade300,
          items: [
            Icon(
              Icons.home,
              size: 40,
              color: Color.fromARGB(255, 49, 202, 169),
            ),
            Icon(
              Icons.bookmark,
              size: 40,
              color: Color.fromARGB(255, 49, 202, 169),
            ),
            Icon(
              Icons.person,
              size: 40,
              color: Color.fromARGB(255, 49, 202, 169),
            ),
          ]),
    );
  }
}
