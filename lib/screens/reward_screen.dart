// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/global_variables.dart';

class RewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4CD964),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 4),
          SvgPicture.asset('assets/svg_icons/coin.svg'),
          Text(
            "Points retrieved sucessfully!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              height: 1.2,
            ),
          ),
          Text(
            "+50 points",
            style: TextStyle(fontSize: 18),
          ),
          Spacer(flex: 3),
          Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current balance: ",
                  style: TextStyle(fontSize: 18, color: Color(0xFF353535)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  width: 80,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFE3E6EC),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/svg_icons/dollar.svg',
                        height: 24,
                        width: 24,
                      ),
                      Spacer(),
                      Text(
                        balance.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
