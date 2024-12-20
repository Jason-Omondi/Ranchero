import 'dart:convert';
// To parse this JSON data, do
//
//     final leaveModel = leaveModelFromJson(jsonString);

List<LeaveModel> leaveModelFromJson(String str) =>
    List<LeaveModel>.from(json.decode(str).map((x) => LeaveModel.fromJson(x)));

String leaveModelToJson(List<LeaveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveModel {
  int? leaveId;
  String? employeeId;
  int? leaveTypeId;
  DateTime? startDate;
  DateTime? endDate;
  int? totalDays;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  LeaveBalance? leaveBalance;

  LeaveModel({
    this.leaveId,
    this.employeeId,
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.totalDays,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.leaveBalance,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
        leaveId: json["leaveId"],
        employeeId: json["employeeId"],
        leaveTypeId: json["leaveTypeId"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        totalDays: json["totalDays"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        leaveBalance: json["leaveBalance"] == null
            ? null
            : LeaveBalance.fromJson(json["leaveBalance"]),
      );

  Map<String, dynamic> toJson() => {
        "leaveId": leaveId,
        "employeeId": employeeId,
        "leaveTypeId": leaveTypeId,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "totalDays": totalDays,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "leaveBalance": leaveBalance?.toJson(),
      };
}

class LeaveBalance {
  int? leaveBalanceId;
  String? employeeId;
  int? leaveTypeId;
  int? totalEntitlementDays;
  int? remainingDays;
  int? consumedDays;
  int? carriedForwardDays;

  LeaveBalance({
    this.leaveBalanceId,
    this.employeeId,
    this.leaveTypeId,
    this.totalEntitlementDays,
    this.remainingDays,
    this.consumedDays,
    this.carriedForwardDays,
  });

  factory LeaveBalance.fromJson(Map<String, dynamic> json) => LeaveBalance(
        leaveBalanceId: json["leaveBalanceId"],
        employeeId: json["employeeId"],
        leaveTypeId: json["leaveTypeId"],
        totalEntitlementDays: json["totalEntitlementDays"],
        remainingDays: json["remainingDays"],
        consumedDays: json["consumedDays"],
        carriedForwardDays: json["carriedForwardDays"],
      );

  Map<String, dynamic> toJson() => {
        "leaveBalanceId": leaveBalanceId,
        "employeeId": employeeId,
        "leaveTypeId": leaveTypeId,
        "totalEntitlementDays": totalEntitlementDays,
        "remainingDays": remainingDays,
        "consumedDays": consumedDays,
        "carriedForwardDays": carriedForwardDays,
      };
}
