import 'dart:convert';

class PatientAuthModel {
    final String? message;
    final String? accessToken;
    final String? refreshToken;
    final DoctorIdToken? doctorIdToken;

    PatientAuthModel({
        this.message,
        this.accessToken,
        this.refreshToken,
        this.doctorIdToken,
    });

    factory PatientAuthModel.fromRawJson(String str) => PatientAuthModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PatientAuthModel.fromJson(Map<String, dynamic> json) => PatientAuthModel(
        message: json["message"],
        accessToken: json["access_Token"] == null ? null : json["access_Token"],
        refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
        doctorIdToken: json["patientID_token"] == null ? null : DoctorIdToken.fromJson(json["patientID_token"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "access_Token": accessToken,
        "refresh_token": refreshToken,
        "patientID_token": doctorIdToken?.toJson(),
    };
}

class DoctorIdToken {
    final String? id;

    DoctorIdToken({
        this.id,
    });

    factory DoctorIdToken.fromRawJson(String str) => DoctorIdToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoctorIdToken.fromJson(Map<String, dynamic> json) => DoctorIdToken(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
