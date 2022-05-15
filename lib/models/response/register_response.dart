import 'dart:convert';

class RegisterResponse {
  RegisterResponse({
    required this.id,
    required this.authToken,
  });

  int id;
  String authToken;

  factory RegisterResponse.fromRawJson(String str) =>
      RegisterResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        id: json["id"],
        authToken: json["authToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "authToken": authToken,
      };
}
