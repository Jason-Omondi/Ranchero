import 'dart:convert';

class DefaultResponse {
  final int? status;
  final String? message;
  final String? returnValue;
  final Map<String, dynamic>? data;
  final bool? res;

  DefaultResponse({
    this.status,
    this.message,
    this.returnValue,
    this.data,
    this.res,
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(
      status: json['status'],
      message: json['message'],
      returnValue: json['return_value'] ?? '',
      data: json['data'],
      res: json['res'],
    );
  }

//   PostLoginResponse loginModelFromJson(String str) =>
//     PostLoginResponse.fromJson(json.decode(str));

// String loginModelToJson(PostLoginResponse data) => json.encode(data.toJson());

// Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data?.toJson(), //here
//       'res': res,
//     };
//   }
}
