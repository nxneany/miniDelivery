import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // ตำแหน่งเริ่มต้น
  static const LatLng _center =
      LatLng(13.736717, 100.523186); // ตัวอย่างที่ตั้งในกรุงเทพฯ

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เลือกตำแหน่งที่ตั้ง'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        myLocationEnabled: true,
        onTap: (LatLng position) {
          // ทำการบันทึกตำแหน่งที่ผู้ใช้คลิก
          Navigator.pop(context, position);
        },
      ),
    );
  }
}
