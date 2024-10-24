import 'dart:io';

import 'package:delivery/profileRider.dart';
import 'package:delivery/profileUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Editrider extends StatefulWidget {
  const Editrider({super.key});

  @override
  State<Editrider> createState() => _EditriderState();
}

class _EditriderState extends State<Editrider> {
  File? _image; // ตัวแปรสำหรับเก็บภาพที่เลือก
  final TextEditingController _nameController =
      TextEditingController(text: 'Ananya Kornsopha');
  final TextEditingController _phoneController =
      TextEditingController(text: '099-999-9999');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456789'); // ควบคุมสำหรับรหัสผ่าน

  // ฟังก์ชันสำหรับเลือกภาพจากแกลเลอรี่
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    // ในที่นี้คุณสามารถทำการบันทึกข้อมูลหรือส่งข้อมูลไปยัง backend ได้
    final String name = _nameController.text;
    final String phone = _phoneController.text;
    final String password = _passwordController.text;

    // ตัวอย่างการแสดงข้อมูลที่บันทึก
    print('Name: $name, Phone: $phone, Password: $password');
    // คุณสามารถเพิ่มโค้ดเพื่อบันทึกข้อมูลที่นี่
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(243, 239, 70, 24),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      const SizedBox(height: 16),
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
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 30,
                            top: 5,
                            bottom: 20,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios),
                                  color: const Color.fromARGB(243, 239, 70, 24),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileRider(), // พาไปยังหน้า Editprofile
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap:
                                            _pickImage, // เรียกใช้งานฟังก์ชันอัพโหลดภาพเมื่อคลิก
                                        child: ClipOval(
                                          child: _image != null
                                              ? Image.file(
                                                  _image!,
                                                  width: 150,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'assets/image/profile.png', // รูปโปรไฟล์เริ่มต้น
                                                  width: 150,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0, // ตำแหน่งล่างสุด
                                        right: 0, // ตำแหน่งขวาสุด
                                        child: IconButton(
                                          icon: const Icon(Icons.add_a_photo,
                                              color: Color.fromARGB(
                                                  243, 239, 70, 24)),
                                          onPressed:
                                              _pickImage, // กดเพื่ออัพโหลดภาพ
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ชื่อผู้ใช้",
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                    ),
                                  ),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม
                                    padding: const EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: TextField(
                                      controller:
                                          _nameController, // ใช้ตัวควบคุมสำหรับชื่อผู้ใช้
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'กรุณาใส่ชื่อผู้ใช้', // ข้อความแนะนำ
                                        hintStyle: GoogleFonts.kanit(
                                          color: Colors.grey, // สีข้อความแนะนำ
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "เบอร์โทร",
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                    ),
                                  ),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม
                                    padding: const EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: TextField(
                                      controller:
                                          _phoneController, // ใช้ตัวควบคุมสำหรับเบอร์โทร
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'กรุณาใส่เบอร์โทร', // ข้อความแนะนำ
                                        hintStyle: GoogleFonts.kanit(
                                          color: Colors.grey, // สีข้อความแนะนำ
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "หมายเลขทะเบียนรถ",
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                    ),
                                  ),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: Text(
                                      '1234 ABC',
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "รหัสผ่าน",
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                    ),
                                  ),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม
                                    padding: const EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: TextField(
                                      controller:
                                          _passwordController, // ใช้ตัวควบคุมสำหรับรหัสผ่าน
                                      obscureText:
                                          true, // ป้องกันการแสดงรหัสผ่าน
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'กรุณาใส่รหัสผ่าน', // ข้อความแนะนำ
                                        hintStyle: GoogleFonts.kanit(
                                          color: Colors.grey, // สีข้อความแนะนำ
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "ยืนยันรหัสผ่าน",
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 108, 108, 108),
                                    ),
                                  ),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม
                                    padding: const EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: TextField(
                                      controller:
                                          _passwordController, // ใช้ตัวควบคุมสำหรับรหัสผ่าน
                                      obscureText:
                                          true, // ป้องกันการแสดงรหัสผ่าน
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'กรุณาใส่รหัสผ่าน', // ข้อความแนะนำ
                                        hintStyle: GoogleFonts.kanit(
                                          color: Colors.grey, // สีข้อความแนะนำ
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileRider(), // พาไปยังหน้า Editprofile
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          243, 239, 70, 24),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      minimumSize:
                                          const Size(double.infinity, 60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ), // เรียกใช้ฟังก์ชันบันทึกเมื่อกดปุ่ม
                                    child: Text(
                                      "บันทึก",
                                      style: GoogleFonts.kanit(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
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
