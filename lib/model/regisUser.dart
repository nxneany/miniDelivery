// To parse this JSON data, do
//
//     final regisUser = regisUserFromJson(jsonString);

import 'dart:convert';

RegisUser regisUserFromJson(String str) => RegisUser.fromJson(json.decode(str));

String regisUserToJson(RegisUser data) => json.encode(data.toJson());

class RegisUser {
  String username;
  String phone;
  String password;
  String address;
  String latitude;
  String longitude;
  String profileImage;

  RegisUser({
    required this.username,
    required this.phone,
    required this.password,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.profileImage,
  });

  factory RegisUser.fromJson(Map<String, dynamic> json) => RegisUser(
        username: json["username"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "password": password,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "profile_image": profileImage,
      };
}
