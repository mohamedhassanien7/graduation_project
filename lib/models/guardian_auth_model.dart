import 'dart:convert';

class GuardianAuthModel {
    final String? message;
    final String? accessToken;
    final String? refreshToken;
    final DoctorIdToken? doctorIdToken;

    GuardianAuthModel({
        this.message,
        this.accessToken,
        this.refreshToken,
        this.doctorIdToken,
    });

    factory GuardianAuthModel.fromRawJson(String str) => GuardianAuthModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GuardianAuthModel.fromJson(Map<String, dynamic> json) => GuardianAuthModel(
        message: json["message"],
        accessToken: json["access_Token"] == null ? null : json["access_Token"],
        refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
        doctorIdToken: json["guardianID_token"] == null ? null : DoctorIdToken.fromJson(json["guardianID_token"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "access_Token": accessToken,
        "refresh_token": refreshToken,
        "guardianID_token": doctorIdToken?.toJson(),
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
