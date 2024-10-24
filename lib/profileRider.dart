import 'dart:io'; // สำหรับการใช้งาน File
import 'package:delivery/Editrider.dart';
import 'package:delivery/historyWork.dart';
import 'package:delivery/homeRider.dart';
import 'package:delivery/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกภาพจาก Gallery
import 'package:google_fonts/google_fonts.dart'; // สำหรับการใช้งาน Google Fonts

class ProfileRider extends StatelessWidget {
  const ProfileRider({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileUser(); // เรียกใช้ ProfileUser
  }
}

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  int currentIndex = 2; // เริ่มต้นที่แท็บ "โปรไฟล์"
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Editrider(), // พาไปยังหน้า Editprofile
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Editrider(), // พาไปยังหน้า Editprofile
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index; // อัปเดต currentIndex
          });

          // เปลี่ยนหน้าไปยังหน้าที่เลือก
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeRider()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HistoryWork()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileRider()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(243, 239, 70, 24),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}
