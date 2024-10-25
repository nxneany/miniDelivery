import 'dart:io';

import 'package:delivery/homeRider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Mapwork extends StatefulWidget {
  const Mapwork({super.key});

  @override
  State<Mapwork> createState() => _MapworkState();
}

class _MapworkState extends State<Mapwork> {
  // late GoogleMapController mapController;
  // final LatLng _center = const LatLng(13.7563, 100.5018); // พิกัดกรุงเทพฯ
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // เก็บรูปที่ถ่าย
  int _updateCount = 0; // ตัวนับการอัปเดตสถานะ

  static const int _maxUpdates = 2; // กำหนดจำนวนการอัปเดตสูงสุด

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
        _updateCount++;
      });
    }
  }

  void _updateStatus() {
    if (_updateCount < _maxUpdates) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('อัปเดตสถานะ'),
            content:
                const Text('คุณต้องการถ่ายรูปหรือเลือกจากแกลเลอรีหรือไม่?'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.gallery);
                },
                child: const Text('เลือกจากแกลเลอรี'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.camera);
                },
                child: const Text('ถ่ายรูป'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ยกเลิก'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('คุณอัปเดตสถานะครบ 2 ครั้งแล้ว')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('กำลังจัดส่ง'),
      ),
      body: Stack(
        children: [
          // GoogleMap(
          //   onMapCreated: _onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: _center,
          //     zoom: 14.0,
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_image != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Image.file(
                        File(_image!.path),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (_updateCount < _maxUpdates)
                    ElevatedButton(
                      onPressed: _updateStatus,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF35637), // สีส้ม
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'อัปเดตสถานะ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (_updateCount >= _maxUpdates)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeRider()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50), // สีเขียว
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'เสร็จงาน',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
