// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/component_widgets.dart/custom_bottom_navigation_bar.dart';
import 'package:hackathon/component_widgets.dart/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: Color(0xFFF1F3F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 24,
                height: 1.2,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 14, 0),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 28,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Container(
              width: double.infinity,
              height: 90,
              color: Color(0xFFF1F3F5),
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(26)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFE5E5E5),
                    ),
                    trailing: IconButton(
                      icon: SvgPicture.asset('assets/svg_icons/edit.svg'),
                      splashColor: Colors.purple,
                      splashRadius: 25,
                      onPressed: () {},
                    ),
                    title: Text(
                      "Uncle Roger",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        color: Color(0xFF353535),
                      ),
                    ),
                    subtitle: Text(
                      "ID: 678412459744",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.2,
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 28),
          ProfileListTile(
            svgPath: 'assets/svg_icons/money.svg',
            title: 'Payment info',
          ),
          SizedBox(height: 23),
          ProfileListTile(
            svgPath: 'assets/svg_icons/history_2.svg',
            title: 'Terminal history',
          ),
          SizedBox(height: 23),
          ProfileListTile(
            svgPath: 'assets/svg_icons/shield.svg',
            title: 'Privacy policy',
          ),
          SizedBox(height: 23),
          ProfileListTile(
            svgPath: 'assets/svg_icons/help.svg',
            title: 'Help Center',
          ),
          SizedBox(height: 23),
          ProfileListTile(
            svgPath: 'assets/svg_icons/settings.svg',
            title: 'Settings',
          ),
          SizedBox(height: 23),
          ProfileListTile(
            svgPath: 'assets/svg_icons/exit.svg',
            title: 'Log out',
            isSelected: true,
          ),
          SizedBox(height: 23),
        ],
      ),
    );
  }
}
