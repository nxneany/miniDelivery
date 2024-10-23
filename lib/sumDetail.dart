import 'package:delivery/homeUser.dart'; // นำเข้าหน้า homeUser
import 'package:delivery/parcelDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sumdetail extends StatefulWidget {
  const Sumdetail({super.key});

  @override
  State<Sumdetail> createState() => _SumdetailState();
}

class _SumdetailState extends State<Sumdetail> {
  final String receiverName = "Ananya Kornsopha";
  final String parcelDetails = "สินค้าประเภท A, B, C";
  final String number = "099-917-5426";

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
                    height: screenHeight * 0.30,
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
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
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
                            builder: (context) => const ParcelDetail(),
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
                                  Text(
                                    "รายการสินค้าที่นำส่ง",
                                    style: GoogleFonts.kanit(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 108, 108, 108)),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "ผู้รับ: $receiverName",
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 131, 131, 131),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "ติดต่อ : $number",
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 131, 131, 131),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "รายละเอียดสินค้า: $parcelDetails",
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                          255, 131, 131, 131),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 2.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // แสดงข้อความยืนยันเมื่อกดปุ่ม
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                "ยืนยันข้อมูล",
                                                style: GoogleFonts.kanit(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: Text(
                                                "ข้อมูลที่ยืนยัน : ผู้รับ : $receiverName, รายละเอียดสินค้า : $parcelDetails",
                                                style: GoogleFonts.kanit(
                                                    fontSize: 16),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    // ปิด Dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("ยกเลิก",
                                                      style:
                                                          GoogleFonts.kanit()),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    // กดปุ่ม "ตกลง"
                                                    Navigator.of(context)
                                                        .pop(); // ปิด Dialog
                                                    // แสดงข้อความสำเร็จ
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            "สำเร็จ",
                                                            style: GoogleFonts.kanit(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          content: Text(
                                                            "ข้อมูลได้ถูกยืนยันแล้ว!",
                                                            style: GoogleFonts
                                                                .kanit(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                // กลับไปยังหน้า homeUser
                                                                Navigator
                                                                    .pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const homeUser(), // กลับไปยังหน้า homeUser
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(
                                                                  "ตกลง",
                                                                  style: GoogleFonts
                                                                      .kanit()),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text("ตกลง",
                                                      style:
                                                          GoogleFonts.kanit()),
                                                ),
                                              ],
                                            );
                                          },
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
                                        "ยืนยัน",
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
