import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class GPSandMapPage extends StatefulWidget {
  const GPSandMapPage({super.key});

  @override
  State<GPSandMapPage> createState() => _GPSandMapPageState();
}

class _GPSandMapPageState extends State<GPSandMapPage> {
  LatLng latLng =
      const LatLng(16.246825669508297, 103.25199289277295); // ตำแหน่งเริ่มต้น
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController(); // สร้างตัวควบคุมแผนที่
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS and Map'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var position = await _determinePosition(); // ดึงตำแหน่งปัจจุบัน
              log('${position.latitude} ${position.longitude}');

              setState(() {
                latLng = LatLng(position.latitude,
                    position.longitude); // อัพเดตตำแหน่งบนแผนที่
              });
              mapController.move(latLng, 15.0); // อัพเดตแผนที่
            },
            child: const Text('Get Location'), // ปุ่มดึงตำแหน่งปัจจุบัน
          ),
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: latLng, // ใช้ตำแหน่งที่อัพเดต
                initialZoom: 15.0, // ระดับการซูมเริ่มต้น
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // ใช้แผนที่จาก OpenStreetMap
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: latLng, // ใช้ latLng ที่อัพเดตตำแหน่ง
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                        child: const Icon(
                          Icons.location_on,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ฟังก์ชันดึงตำแหน่งปัจจุบันของผู้ใช้
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // ตรวจสอบว่าบริการ Location เปิดอยู่หรือไม่
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission =
        await Geolocator.checkPermission(); // ตรวจสอบสิทธิ์การใช้งาน Location
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission(); // ร้องขอสิทธิ์
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(); // ดึงตำแหน่งปัจจุบัน
  }
}
