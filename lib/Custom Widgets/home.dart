import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// custom imports
import '../Screens_or_pages/compelete_task.dart';
import '../Screens_or_pages/new_assembly_screen.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

/*
* this is builder function that retunrs card desing with dynamic 
* parameter for image and title
*/
  Widget _buildCard(
      {required String imageUrl,
      required String title,
      required bool isAssemplyPage,
      required BuildContext context}) {
    return GestureDetector(
      onTap: () =>
          _goToSelectPage(isAssemply: isAssemplyPage, context: context),
      child: SizedBox(
        width: 350,
        child: Card(
          elevation: 0,
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Image(image: AssetImage(imageUrl), height: 50),
              SizedBox(height: 10),
              Text(title, style: GoogleFonts.rosario(fontSize: 25)),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  _goToSelectPage({required bool isAssemply, required BuildContext context}) {
    if (isAssemply)
      return Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return NewAssemblyScreen();
      }));
    else
      return Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return CompeleteTask();
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          _buildCard(
              context: context,
              imageUrl: "images/kitab.png",
              title: "New Assembly",
              isAssemplyPage: true),
          const SizedBox(height: 35),
          _buildCard(
              context: context,
              imageUrl: "images/comp.png",
              title: "Compelete",
              isAssemplyPage: false),
          SizedBox(height: 20),
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
