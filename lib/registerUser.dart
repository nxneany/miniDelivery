import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:delivery/config/config.dart';
import 'package:delivery/login.dart';
import 'package:delivery/model/regisUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  LatLng selectedLocation = LatLng(16.251747, 103.260426); // ตำแหน่งเริ่มต้น
  XFile? image;
  TextEditingController addressController = TextEditingController();
  MapController mapController = MapController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ลงทะเบียน",
                    style: GoogleFonts.kanit(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 108, 108, 108),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildRegistrationForm(context, picker),
              const SizedBox(height: 16),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildRegisterButton(),
    );
  }

  Widget _buildRegistrationForm(BuildContext context, ImagePicker picker) {
    return Container(
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
            _buildTextField("ชื่อผู้ใช้", usernameController, 'เช่น nana'),
            const SizedBox(height: 16),
            _buildTextField("เบอร์โทร", phoneController, 'เช่น 081-111-1111'),
            const SizedBox(height: 16),
            _buildTextField("รหัสผ่าน", passwordController, 'เช่น 12345678',
                obscureText: true),
            const SizedBox(height: 16),
            _buildTextField(
                "ยืนยันรหัสผ่าน", confirmPasswordController, 'เช่น 12345678',
                obscureText: true),
            const SizedBox(height: 16),
            _buildImagePicker(picker),
            const SizedBox(height: 16),
            _buildLocationSelector(),
            const SizedBox(height: 16),
            _buildTextField("รายละเอียดที่อยู่", addressController,
                'กรอกที่อยู่เพิ่มเติม เช่น หมู่บ้าน ถนน'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, String hint,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.kanit(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 108, 108, 108),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: GoogleFonts.kanit(),
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: GoogleFonts.kanit(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker(ImagePicker picker) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () async {
            image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              log(image!.path.toString());
              setState(() {});
            } else {
              log('No Image');
            }
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color.fromARGB(255, 108, 108, 108),
            ),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(0),
          ),
          child: (image != null)
              ? ClipOval(
                  child: Image.file(
                    File(image!.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              : const Icon(
                  Icons.photo,
                  color: Color.fromARGB(255, 108, 108, 108),
                  size: 30,
                ),
        ),
        const SizedBox(width: 10),
        Text(
          "รูปโปรไฟล์",
          style: GoogleFonts.kanit(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 108, 108, 108),
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 12, left: 12),
              child: Icon(
                Icons.pin_drop,
                color: Color.fromARGB(255, 108, 108, 108),
                size: 40,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "ตำแหน่งที่อยู่",
              style: GoogleFonts.kanit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 108, 108, 108),
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: selectedLocation,
              initialZoom: 15.0,
              onTap: (tapPosition, point) {
                setState(() {
                  selectedLocation = point;
                });
                log('Selected Location: $point');
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: selectedLocation,
                    width: 40,
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'ตำแหน่งที่คุณเลือก: ${selectedLocation.latitude}, ${selectedLocation.longitude}',
          style: GoogleFonts.kanit(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Text(
              "เข้าสู่ระบบ",
              style: GoogleFonts.kanit(
                color: const Color.fromARGB(255, 254, 204, 40),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromARGB(255, 254, 204, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
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
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: register,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(243, 239, 70, 24),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "สมัครสมาชิก",
            style: GoogleFonts.kanit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    if (usernameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text) {
      // สร้างข้อมูลสำหรับการลงทะเบียน
      var model = RegisUser(
        username: usernameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        address: addressController.text,
        latitude: selectedLocation.latitude.toString(),
        longitude: selectedLocation.longitude.toString(),
        profileImage:
            "https://i.pinimg.com/control/564x/59/f0/d0/59f0d0067c5d04c5db5f92f517767002.jpg",
      );

      try {
        // ส่งข้อมูลไปยังเซิร์ฟเวอร์
        var response = await http.post(
          Uri.parse(
              "$url/user/registerUser"), // แทนที่ YOUR_API_URL ด้วย URL ของ API ของคุณ
          body: jsonEncode(model),
          headers: {
            "Content-Type": "application/json; charset=utf-8",
          },
        );
        log('Response status: ${response.statusCode}');

        if (response.statusCode == 200) {
          // การลงทะเบียนสำเร็จ นำทางไปยังหน้าเข้าสู่ระบบ
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          // แสดงข้อความแสดงข้อผิดพลาด
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('การลงทะเบียนล้มเหลว: ${response.body}')),
          );
        }
      } catch (error) {
        log(error.toString());
        // แสดงข้อความแสดงข้อผิดพลาด
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('เกิดข้อผิดพลาดในการลงทะเบียน')),
        );
      }
    } else {
      // แสดงข้อความแสดงข้อผิดพลาด
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณาตรวจสอบข้อมูลให้ครบถ้วนและตรงกัน')),
      );
    }
  }

//   void register() async {
//     var config = await Configuration.getConfig();
//     var url = config['apiEndpoint'];

//     // สร้างโมเดล RegisUser
//     var model = RegisUser(
//       username: usernameController.text,
//       phone: phoneController.text,
//       password: passwordController.text,
//       address: addressController.text,
//       latitude: selectedLocation.latitude.toString(),
//       longitude: selectedLocation.longitude.toString(),
//       profileImage:
//           "https://i.pinimg.com/control/564x/59/f0/d0/59f0d0067c5d04c5db5f92f517767002.jpg",
//     );

//     if (model.username.isEmpty ||
//         model.phone.isEmpty ||
//         model.password.isEmpty ||
//         model.address.isEmpty) {
//       _showErrorDialog('กรุณากรอกข้อมูลให้ครบถ้วน');
//       return;
//     }

//     try {
//       var request =
//           http.MultipartRequest('POST', Uri.parse('$url/user/registerUser'));

//       // ใช้ model ในการตั้งค่าฟิลด์
//       request.fields['username'] = model.username;
//       request.fields['phone'] = model.phone;
//       request.fields['password'] = model.password;
//       request.fields['address'] = model.address;
//       request.fields['latitude'] = model.latitude;
//       request.fields['longitude'] = model.longitude;

//       if (image != null) {
//         request.files
//             .add(await http.MultipartFile.fromPath('image', image!.path));
//       }

//       // ส่งคำขอและรับการตอบกลับ
//       var response = await request.send();

//       // อ่านข้อมูลจากการตอบกลับ
//       final responseData = await http.Response.fromStream(response);
//       print(
//           'Response body: ${responseData.body}'); // เพิ่มการพิมพ์ข้อมูลเพื่อช่วยดีบัก

// // ตรวจสอบสถานะการตอบกลับ
//       if (responseData.statusCode == 200) {
//         _showSuccessDialog('สมัครสมาชิกสำเร็จ');
//       } else {
//         // ตรวจสอบว่า response body ไม่ว่างเปล่า
//         if (responseData.body.isNotEmpty) {
//           var errorMessage = jsonDecode(responseData.body)['message'] ??
//               'เกิดข้อผิดพลาดในการสมัครสมาชิก';
//           _showErrorDialog(errorMessage);
//         } else {
//           _showErrorDialog('ไม่มีข้อมูลจากเซิร์ฟเวอร์');
//         }
//       }
//     } catch (e) {
//       _showErrorDialog('เกิดข้อผิดพลาด: ${e.toString()}');
//     }
//   }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ข้อผิดพลาด'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('สำเร็จ'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }
}
