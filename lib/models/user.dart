import 'package:ioaon_mobile_v2/models/response/user_response.dart';

class User extends UserResponse {

  DateTime? usedTimeOut;

  User({
    fullName,
    mobileNumber,
    email,
    googleData,
    facebookData,
    role,
    permissions,
    authToken,
    this.usedTimeOut
  }): super (
    fullName: fullName,
    mobileNumber: mobileNumber,
    email: email,
    googleData: googleData,
    facebookData: facebookData,
    role: role,
    permissions: permissions,
    authToken: authToken,
  );

  void fromUserResponse(UserResponse userResponse) {
    this.fullName = userResponse.fullName;
    this.mobileNumber = userResponse.mobileNumber;
    this.email = userResponse.email;
    this.googleData = userResponse.googleData;
    this.facebookData = userResponse.facebookData;
    this.role = userResponse.role;
    this.permissions = userResponse.permissions;
    this.authToken = userResponse.authToken;
  }
}