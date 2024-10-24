import 'package:delivery/historyWork.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery/detailWork.dart';
import 'package:delivery/profileRider.dart';

class HomeRider extends StatefulWidget {
  const HomeRider({super.key});

  @override
  State<HomeRider> createState() => _HomeRiderState();
}

class _HomeRiderState extends State<HomeRider> {
  // ตัวแปรเก็บ index ปัจจุบันของเมนูด้านล่าง
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // กำหนดค่าเริ่มต้นให้ currentIndex
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    // คำนวณความสูงของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // กำหนดสีพื้นหลังเป็นสีส้มแดง
      backgroundColor: const Color.fromARGB(255, 182, 179, 179),
      body: SafeArea(
        // ใส่ SingleChildScrollView เพื่อให้สามารถเลื่อนหน้าจอได้
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ส่วนของเนื้อหาหลัก
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // เว้นระยะด้านบน
                    SizedBox(height: screenHeight * 0.02),
                    // โลโก้วงกลม
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/image/logo1.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          // แสดงไอคอน error ถ้าโหลดรูปไม่สำเร็จ
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('Error loading image: $error');
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.error,
                                size: 50,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // กล่องสีขาวสำหรับใส่เนื้อหา
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // มุมโค้ง
                        borderRadius: BorderRadius.circular(18),
                        // เงา
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ข้อความต้อนรับ
                          const Text(
                            'ยินดีต้อนรับ Rider',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // รายได้วันนี้
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const ListTile(
                              leading: Icon(Icons.attach_money),
                              title: Text('รายได้วันนี้'),
                              trailing: Text('0 บาท'),
                            ),
                          ),
                        ],
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
                              "ดูงาน",
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
                                color: const Color.fromARGB(255, 108, 108, 108),
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
                                GestureDetector(
                                  onTap: () {
                                    // เปลี่ยนหน้าไปยัง detailWork
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailWork()), // ตรวจสอบให้แน่ใจว่ามีการนำเข้า DetailWork
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(243, 239, 70, 24),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20), // ระยะห่างระหว่างไอคอน
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
                                  width: 210, // กำหนดความกว้างของเส้นให้พอเหมาะ
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // เมนูด้านล่าง
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
            activeIcon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            activeIcon: Icon(Icons.history),
            label: 'ประวัติ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}
