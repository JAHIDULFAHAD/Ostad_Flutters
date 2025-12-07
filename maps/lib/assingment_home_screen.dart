import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AssingmentHomeScreen extends StatefulWidget {
  const AssingmentHomeScreen({super.key});

  @override
  State<AssingmentHomeScreen> createState() => _AssingmentHomeScreenState();
}

class _AssingmentHomeScreenState extends State<AssingmentHomeScreen> {
  late GoogleMapController _mapController;

  LatLng? currentLatLng;
  LatLng? previousLatLng;

  Set<Marker> _markers = {};
  List<LatLng> _polylinePoints = [];
  Set<Polyline> _polylines = {};

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _handlePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }

  void _startLocationTracking() {
    _handlePermission();

    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _getCurrentLocation();
    });

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    previousLatLng = currentLatLng;

    currentLatLng = LatLng(position.latitude, position.longitude);

    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(currentLatLng!, 20),
    );


    _updateMarker();

    _updatePolyline();

    setState(() {});
  }

  void _updateMarker() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId("current_location"),
        position: currentLatLng!,
        infoWindow: InfoWindow(
          title: "My current location",
          snippet:
          "Lat: ${currentLatLng!.latitude}, Lng: ${currentLatLng!.longitude}",
        ),
      ),
    );
  }

  void _updatePolyline() {
    if (currentLatLng != null) {
      _polylinePoints.add(currentLatLng!);

      _polylines.clear();
      _polylines.add(
        Polyline(
          polylineId: PolylineId("live_route"),
          points: _polylinePoints,
          color: Colors.blue,
          width: 5,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Real Time Location Tracker"), centerTitle: true),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.460636, 91.180738),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
