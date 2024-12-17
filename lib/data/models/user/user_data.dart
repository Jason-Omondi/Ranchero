class UserModel {
  final String email;
  final String employeeNumber;
  final String password;
  final String fullName;
  final String phoneNumber;
  final String role;

  UserModel({
    required this.email,
    required this.employeeNumber,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      employeeNumber: json['employeeNumber'] ?? '',
      password: json['password'] ?? '',
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'employeeNumber': employeeNumber,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }
}
