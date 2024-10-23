import 'dart:io';

import 'package:delivery/homeUser.dart';
import 'package:delivery/sumDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ParcelDetail extends StatefulWidget {
  const ParcelDetail({super.key});

  @override
  State<ParcelDetail> createState() => _ParcelDetailState();
}

class _ParcelDetailState extends State<ParcelDetail> {
  File? _image; // ตัวแปรสำหรับเก็บภาพที่ถ่ายจากกล้อง
  final TextEditingController _detailController =
      TextEditingController(); // ตัวควบคุมสำหรับเก็บรายละเอียด

  // ฟังก์ชันสำหรับการถ่ายภาพ
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.30, // สูง 30% ของหน้าจอ
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(243, 239, 70, 24),
                          Color.fromARGB(243, 239, 70, 24),
                          Color.fromARGB(243, 239, 70, 24),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // เงาสีเทา
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // ย้ายเงาในแนวแกน Y
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color.fromARGB(243, 255, 255, 255),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const homeUser(), // พาไปยังหน้า homeUser
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Positioned(
                          top: screenHeight * 0.02,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'assets/image/logo1.png',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error, size: 150);
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ฟิลด์สำหรับกรอกรายละเอียดเพิ่มเติม
                                  TextField(
                                    controller: _detailController,
                                    decoration: InputDecoration(
                                      labelText: 'กรอกรายละเอียดเพิ่มเติม',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    maxLines: 3, // กำหนดจำนวนบรรทัดให้ฟิลด์
                                  ),
                                  const SizedBox(
                                      height:
                                          16), // เว้นระยะห่างระหว่าง TextField และส่วนถัดไป
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 25,
                                      right: 10,
                                      left: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            size: 40,
                                          ),
                                          onPressed: _pickImage,
                                        ),
                                        _image != null
                                            ? Image.file(
                                                _image!,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              )
                                            : const Text(
                                                'ยังไม่มีภาพที่ถ่าย',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 2.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // ใช้ตัวแปร _detailController.text เพื่อเข้าถึงข้อความที่กรอก
                                        print(
                                            "รายละเอียดที่กรอก: ${_detailController.text}");
                                        // สามารถเปลี่ยนเป็นหน้าอื่นได้ที่นี่
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Sumdetail(), // เปลี่ยนไปยังหน้าที่ต้องการ
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            243, 239, 70, 24),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        minimumSize:
                                            const Size(double.infinity, 30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        "ถัดไป",
                                        style: GoogleFonts.kanit(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
