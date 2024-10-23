import 'dart:io';

import 'package:delivery/deliParcel.dart';
import 'package:delivery/editProfile.dart';
import 'package:delivery/homeUser.dart';
import 'package:delivery/login.dart';
import 'package:delivery/myParcel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profileuser extends StatefulWidget {
  const Profileuser({super.key});

  @override
  State<Profileuser> createState() => _ProfileuserState();
}

class _ProfileuserState extends State<Profileuser> {
  int currentIndex = 3; // เริ่มต้นที่แท็บ "โปรไฟล์"
  File? _image; // ตัวแปรสำหรับเก็บภาพที่เลือก
  final TextEditingController _nameController =
      TextEditingController(); // คอนโทรลเลอร์สำหรับชื่อผู้ใช้

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // เก็บไฟล์ภาพในตัวแปร
      });
    }
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
                            bottom: 90,
                          ),
                          child: Column(
                            children: [
                              // เพิ่มไอคอน edit_square ที่มุมขวา
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: const Icon(Icons.edit_square),
                                  color: const Color.fromARGB(243, 239, 70, 24),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Editprofile(), // พาไปยังหน้า Login
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:
                                        _pickImage, // เรียกใช้งานฟังก์ชันอัพโหลดภาพเมื่อคลิก
                                    child: ClipOval(
                                      child: _image != null
                                          ? Image.file(
                                              _image!,
                                              width: 100,
                                              height: 100,
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
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: Text(
                                      'Ananya Kornsopha',
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
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: Text(
                                      '099-999-9999',
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.pin_drop,
                                        color: Color.fromARGB(243, 239, 70, 24),
                                        size: 30,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "ตำแหน่งที่อยู่",
                                        style: GoogleFonts.kanit(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 108, 108, 108),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม

                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 12,
                                          left: 12,
                                          top: 1,
                                          bottom: 1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'เปลี่ยนรหัสผ่าน',
                                            style: GoogleFonts.kanit(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: const Color.fromARGB(
                                                  255, 108, 108, 108),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Editprofile(), // พาไปยังหน้า Login
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color.fromARGB(
                                                  255, 108, 108, 108),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    width: 310, // กำหนดความยาวของกรอบสี่เหลี่ยม
                                    padding: const EdgeInsets.only(
                                        right: 12, left: 12, top: 1, bottom: 1),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey), // เส้นกรอบ
                                      borderRadius:
                                          BorderRadius.circular(12), // มุมมน
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ออกจากระบบ',
                                          style: GoogleFonts.kanit(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: const Color.fromARGB(
                                                243, 239, 70, 24),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.logout,
                                            color: Color.fromARGB(
                                                243, 239, 70, 24),
                                            size:
                                                30, // กำหนดขนาดไอคอนที่นี่ (ปรับขนาดได้ตามต้องการ)
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage(), // พาไปยังหน้า Login
                                              ),
                                            );
                                          },
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
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // สีของเงา
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, 3), // ตำแหน่งของเงา
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
              if (index == 0) {
                // นำทางไปยังหน้า homeUser
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homeUser()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Myparcel()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Deliparcel()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profileuser()),
                );
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromARGB(243, 239, 70, 24),
            unselectedItemColor: Colors.grey,
            selectedIconTheme:
                const IconThemeData(size: 35), // ขนาดไอคอนเมื่อเลือก
            unselectedIconTheme:
                const IconThemeData(size: 30), // ขนาดไอคอนเมื่อไม่เลือก
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                label: 'หน้าหลัก',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2),
                label: 'สินค้าที่ได้รับ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.send),
                label: 'สินค้าที่นำส่ง',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'โปรไฟล์',
              ),
            ],
            selectedLabelStyle:
                GoogleFonts.kanit(fontSize: 14.0, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                GoogleFonts.kanit(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
