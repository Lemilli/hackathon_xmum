// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/component_widgets.dart/custom_bottom_navigation_bar.dart';
import 'package:hackathon/global_variables.dart';
import 'package:hackathon/screens/reward_screen.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isCameraAllowed = false;

  @override
  void initState() {
    super.initState();
    _getCameraPermission().then((value) {
      setState(() {});
    });
  }

  Future<void> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      isCameraAllowed = false;
      await Permission.camera.request().then((value) {
        if (value.isGranted) {
          isCameraAllowed = true;
        }
      });
    } else {
      isCameraAllowed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.white,
        onPressed: () {},
        child: SvgPicture.asset('assets/svg_icons/images.svg'),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          centerTitle: false,
          elevation: 4,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 14),
            child: Text(
              "Scan QR Code",
              style: TextStyle(fontSize: 24, height: 1.2),
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 14, 14, 0),
                child: Icon(Icons.flash_on))
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: !isCameraAllowed
          ? Center(child: Text("Please, allow camera usage."))
          : Center(
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () async {
                  try {
                    await BarcodeScanner.scan();
                    setState(() {
                      balance += 50;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => RewardScreen(),
                        ),
                      );
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please, allow camera usage"),
                    ));
                  }
                },
                child: Text(
                  "Open Scanner",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
    );
  }
}
