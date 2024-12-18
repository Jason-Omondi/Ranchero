import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String? email;
  String? employeeNumber;
  dynamic password;
  String? fullName;
  String? phoneNumber;
  String? role;

  UserModel({
    this.email,
    this.employeeNumber,
    this.password,
    this.fullName,
    this.phoneNumber,
    this.role,
  });

  factory UserModel.fromJson(Map<String?, dynamic> json) => UserModel(
        email: json["email"],
        employeeNumber: json["employeeNumber"],
        password: json["password"] ?? "",
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
      );

  Map<String?, dynamic> toJson() => {
        "email": email,
        "employeeNumber": employeeNumber,
        "password": password ?? "",
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "role": role,
      };
}
