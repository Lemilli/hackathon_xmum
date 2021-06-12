// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileListTile extends StatelessWidget {
  final String svgPath;
  final String title;
  final bool isSelected;

  const ProfileListTile({
    @required this.svgPath,
    @required this.title,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: isSelected == null ? Colors.white : Color(0xFF5D3EA8),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Center(
            child: ListTile(
              dense: true,
              leading: SvgPicture.asset(
                svgPath,
                width: 20,
              ),
              minLeadingWidth: 20,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.2,
                  color: isSelected == null ? Color(0xFF353535) : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: isSelected == null ? Colors.black87 : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
