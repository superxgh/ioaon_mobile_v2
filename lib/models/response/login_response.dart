
class LoginResponse {

  LoginResponse({
    required this.token,
  });


  String token; //: 34c8f657-ddbb-4024-9eb3-f38c6f88ee90}

  Map<String, dynamic> toJson() {
    return {
      'token': this.token,
    };
  }

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['authToken'] as String,
    );
  }
}