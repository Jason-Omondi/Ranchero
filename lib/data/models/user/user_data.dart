class UserModel {
  String? email;
  String? employeeNumber;
  String? password;
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['Email'] ?? '',
      employeeNumber: json['EmployeeNumber'] ?? '',
      password: json['Password'] ?? '',
      fullName: json['FullName'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      role: json['Role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'EmployeeNumber': employeeNumber,
      'Password': password,
      'FullName': fullName,
      'PhoneNumber': phoneNumber,
      'Role': role,
    };
  }
}
