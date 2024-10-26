import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MyMApView extends StatefulWidget {
  const MyMApView({super.key});

  @override
  State<MyMApView> createState() => _MyMApViewState();
}

class _MyMApViewState extends State<MyMApView> {
  Set<Marker> marker = {};
  String address = "";
  LatLng? currentLocation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();
  }
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final location =  await Geolocator.getCurrentPosition();
    List<Placemark> marks = await placemarkFromCoordinates(location.latitude,location.longitude);
    address = "${marks.first.country}-${marks.first.administrativeArea}-${marks.first.locality}";
    marker.add(Marker(
        markerId: MarkerId("location",),
        position:LatLng(location.latitude, location.longitude)
    ));
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: address.isNotEmpty?Text("${address}",style: TextStyle(
          fontSize:20
        ),):null,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        MapsLauncher.launchCoordinates(30.073492305708278, 31.3455066);
      },),
      body: SafeArea(
        child:GoogleMap(
          mapType: MapType.normal,
          onTap: (location)async {
            marker.add(Marker(
                markerId: MarkerId("location",),
                position:location
            ));
            setState(() {

            });
          },
          markers: marker,
          initialCameraPosition: CameraPosition(
            target: LatLng(30.073492305708278, 31.3455066),
            zoom: 13
          ),
        ),
      ),
    );
  }
}
