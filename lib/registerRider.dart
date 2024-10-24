import 'dart:developer';
import 'dart:io';

import 'package:delivery/login.dart';
import 'package:flutter/material.dart';
import 'package:delivery/homeRider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class registerRider extends StatefulWidget {
  const registerRider({super.key});

  @override
  State<registerRider> createState() => _registerRiderState();
}

class _registerRiderState extends State<registerRider> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ลงทะเบียน-ไรเดอร์",
                    style: GoogleFonts.kanit(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 108, 108, 108),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
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
                      Text(
                        "ชื่อผู้ใช้",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.kanit(),
                        decoration: InputDecoration(
                          labelText: 'เช่น nana',
                          labelStyle: GoogleFonts.kanit(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "เบอร์โทร",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.kanit(),
                        decoration: InputDecoration(
                          labelText: 'เช่น 081-111-1111',
                          labelStyle: GoogleFonts.kanit(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "รหัสผ่าน",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.kanit(),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'เช่น 12345678',
                          labelStyle: GoogleFonts.kanit(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "ยืนยันรหัสผ่าน",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.kanit(),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'เช่น 12345678',
                          labelStyle: GoogleFonts.kanit(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "หมายเลขทะเบียนรถ",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.kanit(),
                        decoration: InputDecoration(
                          labelText: 'กท-7490',
                          labelStyle: GoogleFonts.kanit(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () async {
                              image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                log(image!.path.toString());
                                setState(() {});
                              } else {
                                log('No Image');
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color.fromARGB(255, 108, 108, 108),
                              ),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(
                                  0), // เอา padding ออกเพื่อให้รูปเต็มปุ่ม
                            ),
                            child: (image != null)
                                ? ClipOval(
                                    // ใช้ ClipOval เพื่อให้ภาพเป็นวงกลม
                                    child: Image.file(
                                      File(image!.path),
                                      width:
                                          100, // กำหนดขนาดของรูปที่แสดงในปุ่ม
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.photo,
                                    color: Color.fromARGB(255, 108, 108, 108),
                                    size: 30, // ขนาดของไอคอน
                                  ),
                          ),
                          Text(
                            "รูปโปรไฟล์",
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 108, 108, 108),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(
                        "เข้าสู่ระบบ",
                        style: GoogleFonts.kanit(
                          color: const Color.fromARGB(255, 254, 204, 40),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              const Color.fromARGB(255, 254, 204, 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(243, 239, 70, 24),
              padding: const EdgeInsets.symmetric(vertical: 16),
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "สมัครสมาชิก",
              style: GoogleFonts.kanit(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
