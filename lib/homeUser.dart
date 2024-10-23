import 'package:delivery/deliParcel.dart'; // นำเข้าไฟล์สำหรับหน้าสินค้าที่นำส่ง
import 'package:delivery/mapScreen.dart';
import 'package:delivery/myParcel.dart';
import 'package:delivery/parcelDetail.dart';
import 'package:delivery/profileUser.dart'; // นำเข้าไฟล์สำหรับหน้าโปรไฟล์
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeUser extends StatefulWidget {
  const homeUser({super.key});

  @override
  State<homeUser> createState() => _homeUserState();
}

class _homeUserState extends State<homeUser> {
  // ฟังก์ชันเพื่อแสดงหน้าแผนที่
  void showMap() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const MapScreen()), // เปลี่ยนไปยังหน้าของ MapScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    // คำนวณความสูงของหน้าจอ
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
                        stops: [0.1, 0.7, 1.0],
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Positioned(
                        top: screenHeight *
                            0.02, // ตำแหน่งจากด้านบน (ปรับตามต้องการ)
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
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showMap(); // เปิดแผนที่เมื่อคลิกที่ไอคอน
                                          },
                                          child: const Icon(
                                            Icons.share_location,
                                            color: Color.fromARGB(
                                                243, 239, 70, 24),
                                            size: 40,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: 3, // ความกว้างของเส้นแนวตั้ง
                                          height: 70, // ความสูงของเส้นแนวตั้ง
                                          color: const Color.fromARGB(
                                              243, 239, 70, 24), // สีของเส้น
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ผู้ส่ง",
                                            style: GoogleFonts.kanit(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 108, 108, 108),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              right: 10,
                                              left: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      Colors.grey), // เส้นกรอบ
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // มุมมน
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'ตำแหน่งที่ตั้งของคุณ',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 16,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Color.fromARGB(
                                                      255, 108, 108, 108),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.pin_drop,
                                      color: Color.fromARGB(243, 239, 70, 24),
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ผู้รับ",
                                            style: GoogleFonts.kanit(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 108, 108, 108),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              right: 10,
                                              left: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      Colors.grey), // เส้นกรอบ
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // มุมมน
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'ค้นหาจากหมายเลขโทรศัพท์',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 16,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.search,
                                                  color: Color.fromARGB(
                                                      255, 108, 108, 108),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height:
                                        16), // ระยะห่างระหว่างข้อความและเส้น
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ขนาดสินค้า",
                                      style: GoogleFonts.kanit(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal:
                                              20.0), // เว้นระยะขอบซ้ายและขวา
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3, // ความกว้าง 30% ของหน้าจอ
                                            padding: const EdgeInsets.all(
                                                10), // ปรับ padding ตามต้องการ
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      Colors.grey), // เส้นกรอบ
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // มุมมน
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(
                                                  Icons.inventory_2,
                                                  color: Color.fromARGB(
                                                      255, 108, 108, 108),
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Small',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                                Text(
                                                  '0-1 kg',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 14,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                                Text(
                                                  '49 THB',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3, // ความกว้าง 30% ของหน้าจอ
                                            padding: const EdgeInsets.all(
                                                10), // ปรับ padding ตามต้องการ
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      Colors.grey), // เส้นกรอบ
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // มุมมน
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(
                                                  Icons.inventory_2,
                                                  color: Color.fromARGB(
                                                      255, 108, 108, 108),
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Small',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                                Text(
                                                  'มากกว่า 1 kg',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 14,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                                Text(
                                                  '69 THB',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 108, 108, 108),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical:
                                              2.0), // เว้นระยะห่างจากขอบซ้ายและขวา
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ParcelDetail(), // พาไปยังหน้า Editprofile
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              243, 239, 70, 24),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal:
                                                  20), // ปรับขนาด padding
                                          minimumSize:
                                              const Size(double.infinity, 30),
                                          // ปรับขนาดขั้นต่ำของปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          "ถัดไป",
                                          style: GoogleFonts.kanit(
                                            fontSize:
                                                18, // ปรับขนาดฟอนต์ให้ใหญ่ขึ้น
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
          color: Colors.white, // ใส่สีพื้นหลังที่ต้องการ
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
            onTap: (index) {
              if (index == 1) {
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
