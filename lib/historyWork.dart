import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ใช้ Google Fonts
import 'package:delivery/homeRider.dart';
import 'package:delivery/profileRider.dart';
import 'package:delivery/detailcom.dart'; // นำเข้า DetailCom ที่ถูกต้อง

class HistoryWork extends StatefulWidget {
  const HistoryWork({super.key});

  @override
  State<HistoryWork> createState() => _HistoryWorkState();
}

class _HistoryWorkState extends State<HistoryWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ประวัติการทำงาน',
          style: GoogleFonts.kanit(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(243, 239, 70, 24),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10, // จำนวนรายการในประวัติการทำงาน
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(12),
              child: ListTile(
                leading: const Icon(
                  Icons.work,
                  size: 40,
                  color: Color.fromARGB(255, 215, 68, 5),
                ),
                title: Text(
                  'งานที่ ${index + 1}',
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'รายละเอียดงาน',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
                onTap: () {
                  // เมื่อกดที่การ์ด จะนำไปหน้า DetailCom พร้อมส่ง jobNumber
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailCom(
                        jobNumber: index + 1, // ส่งลำดับงานไปหน้า DetailCom
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 1,
        selectedItemColor: const Color.fromARGB(243, 239, 70, 24),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeRider()),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileRider()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'หน้าแรก',
            tooltip: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'ประวัติ',
            tooltip: 'ประวัติการทำงาน',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'โปรไฟล์',
            tooltip: 'โปรไฟล์ของคุณ',
          ),
        ].map((item) {
          // ปรับฟอนต์ของ label ใน BottomNavigationBar
          return BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
            tooltip: item.tooltip,
          );
        }).toList(),
      ),
    );
  }
}
