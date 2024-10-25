// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DetailWork extends StatefulWidget {
//   const DetailWork({super.key});

//   @override
//   State<DetailWork> createState() => _DetailWorkState();
// }

// class _DetailWorkState extends State<DetailWork> {
//   final TextEditingController _imageController = TextEditingController();

//   @override
//   void dispose() {
//     _imageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('รายละเอียดงาน'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             width: 396,
//             height: 707,
//             child: Card(
//               elevation: 4.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start, // จัดข้อความไปที่ซ้าย
//                   children: [
//                     const Text(
//                       'รายละเอียดการจัดส่ง',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "ผู้ส่ง : Ananya Kornsopha",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 108, 108, 108),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       "ติดต่อ : 085-214-7989",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 108, 108, 108),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       "ไรเดอร์ : Nune eiei",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 108, 108, 108),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       "ติดต่อไรเดอร์ : 089-999-9999",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 108, 108, 108),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       "รายละเอียดเพิ่มเติม : ห้ามโยนพัสดุนะคะของข้างในจะแตก",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 108, 108, 108),
//                       ),
//                     ),
//                     const SizedBox(height: 10), // เพิ่มระยะห่างก่อน Column
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0), // เว้นระยะขอบซ้ายและขวา
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildPackageContainer('Small', '0-1 kg', '49 THB'),
//                           _buildPackageContainer(
//                               'Big', 'มากกว่า 1 kg', '69 THB'),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10), // เพิ่มระยะห่างก่อนรูปภาพ
//                     Center(
//                       child: Container(
//                         width: 180, // ความกว้างของรูปภาพ
//                         height: 180, // ความสูงของรูปภาพ
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(8), // ปรับมุมมนตามต้องการ
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 'assets/image/logo1.png'), // เส้นทางไปยังรูปภาพ
//                             fit: BoxFit.cover, // การจัดตำแหน่งรูปภาพ
//                           ),
//                         ),
//                         child: Image.asset(
//                           'assets/image/logo1.png',
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             debugPrint('Error loading image: $error');
//                             return Container(
//                               width: 100,
//                               height: 100,
//                               color: Colors.grey[300],
//                               child: const Icon(
//                                 Icons.error,
//                                 size: 50,
//                                 color: Colors.red,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 100,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, -3),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const mapwo()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(243, 239, 70, 24),
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               minimumSize: const Size(
//                   double.infinity, 60), // กำหนดความกว้างเป็นเต็มพื้นที่
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: Text(
//               "รับงานนี้",
//               style: GoogleFonts.kanit(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPackageContainer(String title, String weight, String price) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.3, // ความกว้าง 30% ของหน้าจอ
//       padding: const EdgeInsets.all(10), // ปรับ padding ตามต้องการ
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color(0xFFF35637)), // เส้นกรอบ
//         borderRadius: BorderRadius.circular(12), // มุมมน
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Icon(
//             Icons.inventory_2,
//             color: Color.fromARGB(255, 108, 108, 108),
//             size: 20,
//           ),
//           Text(
//             title,
//             style: GoogleFonts.kanit(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: const Color.fromARGB(255, 108, 108, 108),
//             ),
//           ),
//           Text(
//             weight,
//             style: GoogleFonts.kanit(
//               fontSize: 12,
//               color: const Color.fromARGB(255, 108, 108, 108),
//             ),
//           ),
//           Text(
//             price,
//             style: GoogleFonts.kanit(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: const Color.fromARGB(255, 108, 108, 108),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
