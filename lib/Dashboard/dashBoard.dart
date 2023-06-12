import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Dashboard/new_Ass_Com.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../Ass_Com/new_assemblu.dart';
import '../Pages/Profile.dart';

class DashBoard extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Dashboard",
            style: GoogleFonts.rosario(color: Colors.black, fontSize: 25),
          ),
        ),
        body: Card(
          elevation: 0,
          child: ListView(
            padding: EdgeInsets.only(top: 70, left: 25, right: 25),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewAssembly()));
                },
                child: NewAssCom(
                  imagePath: "images/kitab.png",
                  textName: "New Assembly",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              NewAssCom(
                imagePath: "images/comp.png",
                textName: "Complete",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 260,
                child: SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      interval: 10,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 30,
                          color: Colors.red.shade700,
                        ),
                        GaugeRange(
                          startValue: 30,
                          endValue: 60,
                          color: Colors.orange.shade700,
                        ),
                        GaugeRange(
                          startValue: 60,
                          endValue: 100,
                          color: Colors.green.shade700,
                        )
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          needleColor: Colors.green.shade600,
                          value: 80,
                          enableAnimation: true,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            "80% Completed",
                            style: GoogleFonts.rosario(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade600),
                          ),
                          positionFactor: 0.79,
                          angle: 90,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Color.fromARGB(255, 49, 202, 169),
                ),
              ),
            ]),
      ),
    );
  }
}
