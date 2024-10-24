import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ใช้ Google Fonts

class DetailCom extends StatelessWidget {
  final int jobNumber; // รับหมายเลขงาน

  const DetailCom({super.key, required this.jobNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดงาน',
          style: GoogleFonts.kanit(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(243, 239, 70, 24),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // กลับไปหน้าก่อนหน้า
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'งานที่ $jobNumber',
              style: GoogleFonts.kanit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'สถานะ: จัดส่งสำเร็จ',
              style: GoogleFonts.kanit(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'รายละเอียดการจัดส่ง',
              style: GoogleFonts.kanit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildTextDetail("ผู้ส่ง : Ananya Kornsopha"),
            _buildTextDetail("ติดต่อ : 085-214-7989"),
            _buildTextDetail("ไรเดอร์ : Nune eiei"),
            _buildTextDetail("ติดต่อไรเดอร์ : 089-999-9999"),
            _buildTextDetail(
                "รายละเอียดเพิ่มเติม : ห้ามโยนพัสดุนะคะของข้างในจะแตก"),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPackageContainer('Small', '0-1 kg', '49 THB'),
                    _buildPackageContainer('Big', 'มากกว่า 1 kg', '69 THB'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/logo1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset(
                  'assets/image/logo1.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
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
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(243, 239, 70, 24),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'กลับไปหน้าประวัติการทำงาน',
                style: GoogleFonts.kanit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromARGB(255, 239, 236, 236),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างคอนเทนเนอร์แพ็กเกจ
  Widget _buildPackageContainer(String size, String weight, String price) {
    return Column(
      children: [
        Text(
          size,
          style: GoogleFonts.kanit(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          weight,
          style: GoogleFonts.kanit(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(
          price,
          style: GoogleFonts.kanit(fontSize: 14),
        ),
      ],
    );
  }

  // ฟังก์ชันย่อยสำหรับแสดงรายละเอียดข้อความ
  Widget _buildTextDetail(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        text,
        style: GoogleFonts.kanit(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 108, 108, 108),
        ),
      ),
    );
  }
}
