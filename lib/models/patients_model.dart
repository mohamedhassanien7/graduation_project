import 'dart:convert';

class PatientsModel {
    final String? message;
    final List<PatientDocId>? patientDocId;

    PatientsModel({
        this.message,
        this.patientDocId,
    });

    factory PatientsModel.fromRawJson(String str) => PatientsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PatientsModel.fromJson(Map<String, dynamic> json) => PatientsModel(
        message: json["message"],
        patientDocId: json["patientDocID"] == null ? [] : List<PatientDocId>.from(json["patientDocID"]!.map((x) => PatientDocId.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "patientDocID": patientDocId == null ? [] : List<dynamic>.from(patientDocId!.map((x) => x.toJson())),
    };
}

class PatientDocId {
    final String? id;
    final String? firstName;
    final String? email;

    PatientDocId({
        this.id,
        this.firstName,
        this.email,
    });

    factory PatientDocId.fromRawJson(String str) => PatientDocId.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PatientDocId.fromJson(Map<String, dynamic> json) => PatientDocId(
        id: json["_id"],
        firstName: json["firstName"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "email": email,
    };
}
