import 'dart:convert';

class DoctorAuthModel {
    final String? message;
    final String? accessToken;
    final String? refreshToken;
    final DoctorIdToken? doctorIdToken;

    DoctorAuthModel({
        this.message,
        this.accessToken,
        this.refreshToken,
        this.doctorIdToken,
    });

    factory DoctorAuthModel.fromRawJson(String str) => DoctorAuthModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoctorAuthModel.fromJson(Map<String, dynamic> json) => DoctorAuthModel(
        message: json["message"],
        accessToken: json["access_Token"] == null ? null : json["access_Token"],
        refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
        doctorIdToken: json["doctorID_token"] == null ? null : DoctorIdToken.fromJson(json["doctorID_token"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "access_Token": accessToken,
        "refresh_token": refreshToken,
        "doctorID_token": doctorIdToken?.toJson(),
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
