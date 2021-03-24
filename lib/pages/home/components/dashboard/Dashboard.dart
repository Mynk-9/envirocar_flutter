import 'package:envirocar_flutter/shared_components/BlueButton.dart';
import 'package:flutter/material.dart';

import 'RedCircularButton.dart';
import 'package:envirocar_flutter/pages/home/components/dashboard/DashboardArrowCards.dart';
import '../../../../theme/colors_cario.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              // the blue space
              SizedBox(
                height: 80,
                child: Container(
                  color: CarioColors.blueDarkCario,
                ),
              ),
              // card with the readings
              FractionalTranslation(
                translation: Offset(0, 0.3),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Total Tracks"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "0 km",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Total Distance"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "00:00 h",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Total Duration"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // spacing to adjust the items below
          SizedBox(
            height: 50,
          ),

          // "recording settings" box
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: CarioColors.carioColorPrimaryDark,
            ),
            margin: EdgeInsets.only(top: 0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Recording Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // the four red buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RedCircularButton("Bluetooth", Icons.bluetooth, () {}),
                RedCircularButton("OBD", Icons.phone_android, () {}),
                RedCircularButton("GPS", Icons.gps_fixed, () {}),
                RedCircularButton("Car", Icons.directions_car, () {}),
              ],
            ),
          ),

          // two cards
          ArrowCard(
            iconData: Icons.bluetooth_audio,
            textHead: "No ODB-II adapter selected",
            textBody: "Click here to select one",
            onClick: () {},
          ),
          ArrowCard(
            iconData: Icons.directions_car,
            textHead: "No car type selected",
            textBody: "Click here to select one",
            onClick: () {},
          ),

          // start track
          BlueButton("START TRACK", () {})
        ],
      ),
    );
  }
}
