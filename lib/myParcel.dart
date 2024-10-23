import 'package:delivery/deliParcel.dart';
import 'package:delivery/profileUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeUser.dart'; // นำเข้าไฟล์หน้า homeUser

class Myparcel extends StatefulWidget {
  const Myparcel({super.key});

  @override
  State<Myparcel> createState() => _MyparcelState();
}

class _MyparcelState extends State<Myparcel> {
  int currentIndex = 1; // เก็บค่า index ของ BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    // คำนวณความสูงของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "รายการพัสดุที่อยู่ระหว่างการจัดส่ง",
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(243, 239, 70, 24),
                                ),
                              ),
                              const SizedBox(
                                  height: 8), // ระยะห่างระหว่างข้อความและเส้น
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Text(
                                "ผู้ส่ง : Ananya Kornsopha",
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 108, 108, 108),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // ทำให้ข้อความอยู่ด้านซ้ายและไอคอนอยู่ด้านขวา
                                children: [
                                  Text(
                                    "ติดต่อ : 099-917-5486",
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160),
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios,
                                      color: Color.fromARGB(243, 239, 70,
                                          24)), // ใช้ไอคอนที่ถูกต้อง
                                ],
                              ),
                              const SizedBox(
                                  height: 20), // ระยะห่างระหว่างไอคอน
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // จัดตำแหน่งให้เป็นกลาง
                                children: [
                                  const Icon(
                                    Icons.local_shipping,
                                    color: Color.fromARGB(243, 239, 70, 24),
                                  ),
                                  const SizedBox(
                                      width: 8), // ระยะห่างระหว่างไอคอนและเส้น
                                  Container(
                                    height: 2, // ความสูงของเส้น
                                    width:
                                        210, // กำหนดความกว้างของเส้นให้พอเหมาะ
                                    color: const Color.fromARGB(
                                        243, 239, 70, 24), // สีของเส้น
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // ระยะห่างระหว่างเส้นและไอคอนถัดไป
                                  const Icon(
                                    Icons.pin_drop,
                                    color: Color.fromARGB(243, 239, 70, 24),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "รายการพัสดุที่อยู่ระหว่างการจัดส่ง",
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(243, 239, 70, 24),
                                ),
                              ),
                              const SizedBox(
                                  height: 8), // ระยะห่างระหว่างข้อความและเส้น
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Text(
                                "ผู้ส่ง : Ananya Kornsopha",
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 108, 108, 108),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // ทำให้ข้อความอยู่ด้านซ้ายและไอคอนอยู่ด้านขวา
                                children: [
                                  Text(
                                    "ติดต่อ : 099-917-5486",
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160),
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios,
                                      color: Color.fromARGB(243, 239, 70,
                                          24)), // ใช้ไอคอนที่ถูกต้อง
                                ],
                              ),
                              const SizedBox(
                                  height: 20), // ระยะห่างระหว่างไอคอน
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // จัดตำแหน่งให้เป็นกลาง
                                children: [
                                  const Icon(
                                    Icons.local_shipping,
                                    color: Color.fromARGB(243, 239, 70, 24),
                                  ),
                                  const SizedBox(
                                      width: 8), // ระยะห่างระหว่างไอคอนและเส้น
                                  Container(
                                    height: 2, // ความสูงของเส้น
                                    width:
                                        210, // กำหนดความกว้างของเส้นให้พอเหมาะ
                                    color: const Color.fromARGB(
                                        243, 239, 70, 24), // สีของเส้น
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // ระยะห่างระหว่างเส้นและไอคอนถัดไป
                                  const Icon(
                                    Icons.pin_drop,
                                    color: Color.fromARGB(243, 239, 70, 24),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "รายการพัสดุที่อยู่ระหว่างการจัดส่ง",
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(243, 239, 70, 24),
                                ),
                              ),
                              const SizedBox(
                                  height: 8), // ระยะห่างระหว่างข้อความและเส้น
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Text(
                                "ผู้ส่ง : Ananya Kornsopha",
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 108, 108, 108),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // ทำให้ข้อความอยู่ด้านซ้ายและไอคอนอยู่ด้านขวา
                                children: [
                                  Text(
                                    "ติดต่อ : 099-917-5486",
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 160, 160, 160),
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios,
                                      color: Color.fromARGB(243, 239, 70,
                                          24)), // ใช้ไอคอนที่ถูกต้อง
                                ],
                              ),
                              const SizedBox(
                                  height: 20), // ระยะห่างระหว่างไอคอน
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // จัดตำแหน่งให้เป็นกลาง
                                children: [
                                  const Icon(
                                    Icons.local_shipping,
                                    color: Color.fromARGB(243, 239, 70, 24),
                                  ),
                                  const SizedBox(
                                      width: 8), // ระยะห่างระหว่างไอคอนและเส้น
                                  Container(
                                    height: 2, // ความสูงของเส้น
                                    width:
                                        210, // กำหนดความกว้างของเส้นให้พอเหมาะ
                                    color: const Color.fromARGB(
                                        243, 239, 70, 24), // สีของเส้น
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // ระยะห่างระหว่างเส้นและไอคอนถัดไป
                                  const Icon(
                                    Icons.pin_drop,
                                    color: Color.fromARGB(243, 239, 70, 24),
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
            currentIndex: currentIndex, // ใช้ currentIndex
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
            unselectedLabelStyle: GoogleFonts.kanit(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
