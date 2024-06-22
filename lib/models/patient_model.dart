import 'dart:convert';

class PatientModel {
  final String? message;
  final OnePatientDocId? onePatientDocId;

  PatientModel({
    this.message,
    this.onePatientDocId,
  });

  factory PatientModel.fromRawJson(String str) =>
      PatientModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        message: json["message"],
        onePatientDocId: json["OnePatientDocID"] == null
            ? null
            : OnePatientDocId.fromJson(json["OnePatientDocID"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "OnePatientDocID": onePatientDocId?.toJson(),
      };
}

class OnePatientDocId {
  final String? firstName;
  final String? phoneOne;
  final String? gender;
  final String? homeAddress;
  final num? currentMotionRate;
  final num? heartRate;
  final DateTime? birthDate;
  final List<GuardianId>? guardianIds;

  OnePatientDocId({
    this.firstName,
    this.phoneOne,
    this.gender,
    this.heartRate,
    this.currentMotionRate,
    this.homeAddress,
    this.birthDate,
    this.guardianIds,
  });

  factory OnePatientDocId.fromJson(Map<String, dynamic> json) =>
      OnePatientDocId(
        firstName: json["firstName"],
        phoneOne: json["phone_one"],
        gender: json["gender"],
        currentMotionRate: json["currentMotionRate"],
        heartRate: json["heartRate"],
        homeAddress: json["homeAddress"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        guardianIds: json["guardianIds"] == null
            ? []
            : List<GuardianId>.from(
                json["guardianIds"]!.map((x) => GuardianId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "phone_one": phoneOne,
        "gender": gender,
        "currentMotionRate": currentMotionRate,
        "heartRate": heartRate,
        "homeAddress": homeAddress,
        "birthDate": birthDate?.toIso8601String(),
        "guardianIds": guardianIds == null
            ? []
            : List<dynamic>.from(guardianIds!.map((x) => x.toJson())),
      };
}

class GuardianId {
  final String? firstName;
  final String? phoneOne;

  GuardianId({
    this.firstName,
    this.phoneOne,
  });

  factory GuardianId.fromRawJson(String str) =>
      GuardianId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GuardianId.fromJson(Map<String, dynamic> json) => GuardianId(
        firstName: json["firstName"],
        phoneOne: json["phone_one"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "phone_one": phoneOne,
      };
}
