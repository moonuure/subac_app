import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subac_app/Pages/compelete_task.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Dashboard/new_Ass_Com.dart';
import '../Pages/new_assemblu.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.only(top: 70, left: 25, right: 25),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewAssembly()));
            },
            child: NewAssemplyCompelete(imagePath: "images/kitab.png"
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CompeleteTask()));
            },
            child: NewAssemplyCompelete(
              imagePath: "images/comp.png",
            ),
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
    );
  }
}
