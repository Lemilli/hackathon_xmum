// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/component_widgets.dart/cash_white_container.dart';
import 'package:hackathon/component_widgets.dart/custom_bottom_navigation_bar.dart';
import 'package:hackathon/component_widgets.dart/money_list_tile.dart';
import 'package:hackathon/global_variables.dart';

class MoneyScreen extends StatelessWidget {
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
              "Point Status",
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
                  color: Color(0xFF5D3EA8),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(26)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Center(
                    child: ListTile(
                      leading: SvgPicture.asset(
                          'assets/svg_icons/dollar_purple.svg'),
                      title: Text(
                        "Current Balance",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.2,
                          color: Color(0xFF353535),
                        ),
                      ),
                      subtitle: Text(
                        balance.toString() + " pt",
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 28),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(width: 23),
                Expanded(
                  child: CashWhiteContainer(
                    svgPath: "assets/svg_icons/history.svg",
                    text: "View history",
                  ),
                ),
                SizedBox(width: 23),
                Expanded(
                  child: CashWhiteContainer(
                    svgPath: "assets/svg_icons/cash_out.svg",
                    text: "Cash out point",
                  ),
                ),
                SizedBox(width: 23),
                Expanded(
                  child: CashWhiteContainer(
                    svgPath: "assets/svg_icons/pay.svg",
                    text: "Pay online",
                  ),
                ),
                SizedBox(width: 23),
              ],
            ),
            SizedBox(height: 25),
            MoneyListTile(
              svgPath: "assets/svg_icons/question_mark.svg",
              title: "Getting started",
              subtitle: "All you need to know about our point system",
            ),
            SizedBox(height: 18),
            MoneyListTile(
              svgPath: "assets/svg_icons/cart.svg",
              title: "Special promotions",
              subtitle: "Check out the newest promotions",
            ),
            SizedBox(height: 18),
            MoneyListTile(
              svgPath: "assets/svg_icons/dollar_black.svg",
              title: "Earn more points",
              subtitle: "Read some tips from us on getting points",
            ),
          ],
        ),
      ),
    );
  }
}
