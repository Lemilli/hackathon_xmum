// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyListTile extends StatelessWidget {
  final String svgPath;
  final String title;
  final String subtitle;

  const MoneyListTile({
    @required this.svgPath,
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 5),
          child: ListTile(
            dense: true,
            leading: SvgPicture.asset(
              svgPath,
              width: 30,
            ),
            minLeadingWidth: 10,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                height: 1.2,
                color: Color(0xFF353535),
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                color: Color(0xFF353535),
                fontSize: 12,
                height: 1.2,
              ),
            ),
            trailing: Icon(
              Icons.more_vert,
              color: Color(0xFFCDCFDB),
            ),
          ),
        ),
      ),
    );
  }
}
