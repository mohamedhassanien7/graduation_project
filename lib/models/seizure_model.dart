import 'dart:convert';

class SeizureModel {
    final String? message;
    final List<PatientSeizure>? patientSeizure;

    SeizureModel({
        this.message,
        this.patientSeizure,
    });

    factory SeizureModel.fromRawJson(String str) => SeizureModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SeizureModel.fromJson(Map<String, dynamic> json) => SeizureModel(
        message: json["message"],
        patientSeizure: json["patientSeizure"] == null ? [] : List<PatientSeizure>.from(json["patientSeizure"]!.map((x) => PatientSeizure.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "patientSeizure": patientSeizure == null ? [] : List<dynamic>.from(patientSeizure!.map((x) => x.toJson())),
    };
}

class PatientSeizure {
    final String? id;
    final String? firstName;
    final String? email;
    final List<SeizureHistory>? seizureHistory;

    PatientSeizure({
        this.id,
        this.firstName,
        this.email,
        this.seizureHistory,
    });

    factory PatientSeizure.fromRawJson(String str) => PatientSeizure.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PatientSeizure.fromJson(Map<String, dynamic> json) => PatientSeizure(
        id: json["_id"],
        firstName: json["firstName"],
        email: json["email"],
        seizureHistory: json["seizureHistory"] == null ? [] : List<SeizureHistory>.from(json["seizureHistory"]!.map((x) => SeizureHistory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "email": email,
        "seizureHistory": seizureHistory == null ? [] : List<dynamic>.from(seizureHistory!.map((x) => x.toJson())),
    };
}

class SeizureHistory {
    final String? id;
    final int? heartRate;
    final double? motionRate;
    final DateTime? time;
    final double? lat;
    final double? lng;

    SeizureHistory({
        this.id,
        this.heartRate,
        this.motionRate,
        this.time,
        this.lat,
        this.lng,
    });

    factory SeizureHistory.fromRawJson(String str) => SeizureHistory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SeizureHistory.fromJson(Map<String, dynamic> json) => SeizureHistory(
        id: json["_id"],
        heartRate: json["heartRate"],
        motionRate: json["motionRate"]?.toDouble(),
        time: json["Time"] == null ? null : DateTime.parse(json["Time"]),
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "heartRate": heartRate,
        "motionRate": motionRate,
        "Time": time?.toIso8601String(),
        "lat": lat,
        "lng": lng,
    };
}
