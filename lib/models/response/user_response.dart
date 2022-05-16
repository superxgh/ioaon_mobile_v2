// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

class UserResponse {
  UserResponse({
    required this.fullName,
    required this.mobileNumber,
    required this.email,
    this.googleData,
    this.facebookData,
    required this.role,
    required this.permissions,
    required this.authToken,
  });

  String fullName; //": "Somjai Dee",
  String mobileNumber; //": "0958655455",
  String email; //": "a@a.com",
  dynamic googleData; //": null,
  dynamic facebookData; //": null,
  String role; //": "STAFF",
  String permissions; //": "ALL_JOB",
  String authToken; //": "8fe5f0c2-e7fc-4e6a-9613-15875eb0a76f"

  factory UserResponse.fromRawJson(String str) =>
      UserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    return {
      'fullName': this.fullName,
      'mobileNumber': this.mobileNumber,
      'email': this.email,
      'googleData': this.googleData,
      'facebookData': this.facebookData,
      'role': this.role,
      'permissions': this.permissions,
      'authToken': this.authToken,
    };
  }

  factory UserResponse.fromJson(Map<String, dynamic> map) {
    return UserResponse(
      fullName: map['fullName'] as String,
      mobileNumber: map['mobileNumber'] as String,
      email: map['email'] as String,
      googleData: map['googleData'] as dynamic,
      facebookData: map['facebookData'] as dynamic,
      role: map['role'] as String,
      permissions: map['permissions'] as String,
      authToken: map['authToken'] as String,
    );
  }

  factory UserResponse.empty() {
    return UserResponse(
      fullName: '',
      mobileNumber: '',
      email: '',
      googleData: null,
      facebookData: null,
      role: '',
      permissions: '',
      authToken:'',
    );
  }

  @override
  String toString() {
    return 'UserResponse{fullName: $fullName, mobileNumber: $mobileNumber, email: $email, googleData: $googleData, facebookData: $facebookData, role: $role, permissions: $permissions, authToken: $authToken}';
  }
}