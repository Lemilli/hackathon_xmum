// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/screens/homepage.dart';
import 'package:hackathon/screens/money_screen.dart';
import 'package:hackathon/screens/profile_screen.dart';
import 'package:hackathon/screens/scan_screen.dart';

import '../global_variables.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: BottomNavigationBar(
        currentIndex: navBarIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg_icons/gps_icon.svg',
                color: navBarIndex == 0 ? Colors.black : Color(0xFF979797)),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg_icons/wallet.svg',
                color: navBarIndex == 1 ? Colors.black : Color(0xFF979797)),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg_icons/scan.svg',
                color: navBarIndex == 2 ? Colors.black : Color(0xFF979797)),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg_icons/user_icon.svg',
                color: navBarIndex == 3 ? Colors.black : Color(0xFF979797)),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        onTap: (int index) {
          navBarIndex = index;
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => Homepage(),
              ),
            );
          } else if (index == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => MoneyScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => ScanScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
