import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late GoogleMapController mapController;

  final LatLng center = LatLng(13.736717, 100.523186);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Map'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: center,
                    zoom: 13.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('Home'),
                      position: center,
                      )
                  },
                ),
              ))
        ],
      ),
    );
  }
}
