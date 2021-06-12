// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/component_widgets.dart/custom_bottom_navigation_bar.dart';
import 'package:hackathon/component_widgets.dart/pin_widget.dart';
import 'package:hackathon/global_variables.dart';
import 'package:location/location.dart';

import '../directions_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(3.1601279888959115, 101.71006336563275),
    zoom: 14,
  );

  GoogleMapController _googleMapController;
  Directions _directionsInfo;

  Location location = Location();

  PermissionStatus _permissionGranted;

  bool isPinVisible = false;
  String imagePath, name, street;
  int percentage = 0;

  Future<void> _checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkPermissions();
    if (_permissionGranted != PermissionStatus.granted) {
      _requestPermission();
    }
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final markers = {
      Marker(
        markerId: const MarkerId('XMUM'),
        infoWindow: const InfoWindow(title: 'Xiamen University Malaysia'),
        onTap: () {
          setState(() {
            imagePath = "assets/images/xmum.jpg";
            name = "XMUM Terminal";
            street = "Jalan Sunsuria, Bandar Sunsuria";
            percentage = 85;
            isPinVisible = true;
          });
        },
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(2.832575118129967, 101.70689989545816),
      ),
      Marker(
        markerId: const MarkerId('Pavilion'),
        infoWindow: const InfoWindow(title: 'KL Pavilion'),
        onTap: () {
          setState(() {
            imagePath = "assets/images/pavilion.jpg";
            name = "Pavilion Terminal";
            street = "Bukit Bintang 168";
            percentage = 55;
            isPinVisible = true;
          });
        },
        icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(3.1491605779463967, 101.71314981400545),
      ),
      Marker(
        markerId: const MarkerId('Hospital'),
        infoWindow: const InfoWindow(title: 'Pantai Hospital'),
        onTap: () {
          setState(() {
            imagePath = "assets/images/pantai.jpg";
            name = "Pantai Hospital Terminal";
            street = "Jalan Bukit Pantai 8";
            percentage = 94;
            isPinVisible = true;
          });
        },
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(3.1722216829756693, 101.70151589765914),
      ),
      Marker(
        markerId: const MarkerId('Merdeka Square'),
        infoWindow: const InfoWindow(title: 'Merdeka Square'),
        onTap: () {
          setState(() {
            imagePath = "assets/images/merdeka.jpg";
            name = "Merdeka Terminal";
            street = "Jalan Raja";
            percentage = 42;
            isPinVisible = true;
          });
        },
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(3.1492708951393134, 101.69379462492253),
      ),
      Marker(
        markerId: const MarkerId('Menara KL'),
        infoWindow: const InfoWindow(title: 'Menara KL'),
        onTap: () {
          setState(() {
            imagePath = "assets/images/menara.jpg";
            name = "Menara Terminal";
            street = "Jalan Punchak Off 2";
            percentage = 77;
            isPinVisible = true;
          });
        },
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(3.1533209854462365, 101.70409363138891),
      ),
      Marker(
        markerId: const MarkerId('Aquaria KLCC'),
        infoWindow: const InfoWindow(title: 'Aquaria KLCC'),
        onTap: () {
          setState(() {
            imagePath = "assets/images/aquaria.jpg";
            name = "Aquaria Terminal";
            street = "Jalan Pinang";
            percentage = 83;
            isPinVisible = true;
          });
        },
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(3.1540836797368694, 101.71329082426958),
      ),
    };

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          elevation: 4,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: [
                const Text(
                  'Locate Terminal',
                  style: const TextStyle(
                    fontSize: 24,
                    height: 1.2,
                  ),
                ),
                Spacer(),
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
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                width: 350,
                height: 34,
                child: TextField(
                  style: TextStyle(fontSize: 16, height: 1.36),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    prefixIcon: Icon(Icons.search, color: Color(0xFF262F56)),
                    suffixIcon: Icon(Icons.close, color: Color(0xFFC4C4C4)),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _permissionGranted != PermissionStatus.granted
          ? Center(child: Text("Please, allow geolocation"))
          : Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (controller) =>
                      _googleMapController = controller,
                  markers: markers,
                  onTap: (LatLng loc) {
                    setState(() {
                      isPinVisible = false;
                    });
                  },
                ),
                if (isPinVisible)
                  PinWidget(
                    imagePath: imagePath,
                    name: name,
                    street: street,
                    percentage: percentage,
                  ),
                if (_directionsInfo != null)
                  Positioned(
                    top: 20.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: Text(
                        '${_directionsInfo.totalDistance}, ${_directionsInfo.totalDuration}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
