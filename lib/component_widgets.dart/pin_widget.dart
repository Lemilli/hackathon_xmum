// @dart=2.9

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PinWidget extends StatelessWidget {
  final String name, street;
  final int percentage;

  const PinWidget({
    Key key,
    @required this.name,
    @required this.street,
    @required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 32,
      child: Container(
        width: screenWidth * 0.9,
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 95,
              width: 100,
              padding: EdgeInsets.only(right: 8),
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: percentage.toDouble() / 100.0,
                center: Text("$percentage%"),
                progressColor: percentage < 80 ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                Text(
                  street,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.25,
                  ),
                ),
                Text(
                  "5 km away, 30 mins",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
