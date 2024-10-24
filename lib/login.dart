import 'package:delivery/homeUser.dart';
import 'package:delivery/registerRider.dart';
import 'package:delivery/registerUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery/loginRider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  // Function to navigate to the registration screen
  void registerUser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterUser()),
    );
  }

  // Function to navigate to the rider login screen
  void loginRider() {
    // TODO: Implement rider login logic
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginRider()), // เปลี่ยนไปยังหน้าล็อกอินไรเดอร์
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
                    "เข้าสู่ระบบ",
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
                        style: GoogleFonts.kanit(),
                        decoration: InputDecoration(
                          labelText: 'เช่น 099-999-9999',
                          labelStyle: GoogleFonts.kanit(),
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
                        style: GoogleFonts.kanit(),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'เช่น saru1234',
                          labelStyle: GoogleFonts.kanit(),
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
                          const Spacer(), // Spacer to push button to the right
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
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const registerRider()), // Ensure this matches your class name
                        );
                      },
                      child: Text(
                        "สมัครไรเดอร์",
                        style: GoogleFonts.kanit(
                          color: const Color.fromARGB(255, 254, 204, 40),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              const Color.fromARGB(255, 254, 204, 40),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: registerUser,
                      child: Text(
                        "สมัครสมาชิก",
                        style: GoogleFonts.kanit(
                          color: const Color.fromARGB(255, 254, 204, 40),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              const Color.fromARGB(255, 254, 204, 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              // Add buttons for Rider and User Login
              Center(
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min, // ปรับให้ Row มีขนาดตามเนื้อหา
                  children: [
                    ElevatedButton(
                      onPressed: loginRider,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(248, 239, 70, 24),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize:
                            const Size(120, 60), // กำหนดความกว้างของปุ่ม
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "เข้าสู่ระบบไรเดอร์",
                        style: GoogleFonts.kanit(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ElevatedButton(
            onPressed: () {
              // นำทางไปยังหน้าหลักผู้ใช้
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const homeUser()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(243, 239, 70, 24),
              padding: const EdgeInsets.symmetric(vertical: 16),
              minimumSize: const Size(
                  double.infinity, 60), // กำหนดความกว้างเป็นเต็มพื้นที่
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
      ),
    );
  }
}
