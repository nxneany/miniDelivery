import 'package:delivery/homeRider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery/homeRider.dart'; // นำเข้าคลาส HomeRider

class LoginRider extends StatefulWidget {
  @override
  _LoginRiderState createState() => _LoginRiderState();
}

class _LoginRiderState extends State<LoginRider> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  // ฟังก์ชันสำหรับเข้าสู่ระบบไรเดอร์
  void loginRider() {
    String phone = phoneController.text;
    String password = passwordController.text;

    // TODO: Implement login logic here
    print('Phone: $phone, Password: $password');

    // นำทางไปยังหน้า HomeRider
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeRider()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/logo2.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, size: 150);
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "เข้าสู่ระบบไรเดอร์",
                    style: GoogleFonts.kanit(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 108, 108, 108),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "หมายเลขโทรศัพท์",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'เช่น 099-999-9999',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "รหัสผ่าน",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 108, 108, 108),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'เช่น saru1234',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          Text(
                            "จดจำบัญชีของฉัน",
                            style: GoogleFonts.kanit(),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // TODO: Implement forgot password logic
                            },
                            child: Text(
                              'ลืมรหัสผ่าน?',
                              style: GoogleFonts.kanit(
                                color: const Color.fromARGB(255, 33, 156, 243),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: loginRider,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(243, 239, 70, 24),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(
                        double.infinity, 60), // กำหนดให้ปุ่มมีความกว้างเต็ม
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "เข้าสู่ระบบ",
                    style: GoogleFonts.kanit(
                      fontSize: 20,
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
    );
  }
}
