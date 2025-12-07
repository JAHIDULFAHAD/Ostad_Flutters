import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maps"), centerTitle: true),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        trafficEnabled: true,
        onTap: (LatLng latLng) {
          print(latLng);
        },
        onLongPress: (LatLng latLng) {
          print(latLng);
        },
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(23.460636, 91.180738),
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: <Marker>{
          Marker(
            markerId: MarkerId("home"),
            position: LatLng(23.44989381260469, 91.18017666041851),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
            onTap: () {
              print("Marker Tapped");
            },
            infoWindow: InfoWindow(title: "My House", onTap: () {}),
            draggable: true,
            onDragStart: (LatLng latLng) {
              print("Drag Start $latLng");
            },
            onDragEnd: (LatLng latLng) {
              print("Drag End $latLng");
            },
          ),
          Marker(
            markerId: MarkerId("office"),
            position: LatLng(23.45933049536338, 91.1812636256218),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
            onTap: () {
              print("Marker Tapped");
            },
            infoWindow: InfoWindow(title: "My Office", onTap: () {}),
            draggable: true,
            onDragStart: (LatLng latLng) {
              print("Drag Start $latLng");
            },
            onDragEnd: (LatLng latLng) {
              print("Drag End $latLng");
            },
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId("home_circle"),
            center: LatLng(23.44989381260469, 91.18017666041851),
            radius: 100,
            fillColor: Colors.blue.withOpacity(0.2),
            strokeColor: Colors.blue,
            strokeWidth: 2,
            visible: true,
            onTap: () {
              print("Circle Tapped");
            },
            consumeTapEvents: true,
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId("home_office"),
            points: [
              LatLng(23.44989381260469, 91.18017666041851),
              LatLng(23.45933049536338, 91.1812636256218),
            ],
            color: Colors.blue,
            width: 4,
            visible: true,
            onTap: () {
              print("Polygon Tapped");
            },
            consumeTapEvents: true,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId("home_office_polygon"),
            points: [
              LatLng(23.457937841991527, 91.18244279175997),
              LatLng(23.4588433144056, 91.18659820407629),
              LatLng(23.45528690047007, 91.18702031672001),
              LatLng(23.451802979817113, 91.18385162204504),
              LatLng(23.45657962172754, 91.18191339075565),
              LatLng(23.461973051660344, 91.18405915796757),
              LatLng(23.458679382530118, 91.1847672611475),
            ],
            consumeTapEvents: true,
            onTap: () {
              print("Polygon Tapped");
            },
            fillColor: Colors.red.withOpacity(0.2),
            strokeColor: Colors.red,
            strokeWidth: 2,
            visible: true,
            geodesic: true,
          ),
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(23.45933049536338, 91.1812636256218),
                    zoom: 18,
                  ),

                ),
              );
            },
            child: Icon(Icons.factory_outlined),
          ),
          FloatingActionButton(onPressed: () {
            _mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(23.44989381260469, 91.18017666041851),
                  zoom: 18,
                ),
              ),
            );
          }, child: Icon(Icons.house)),
        ],
      ),
    );
  }
}
