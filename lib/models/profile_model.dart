import 'dart:convert';

class ProfileModel {
    final String? message;
    final Doctor? doctor;

    ProfileModel({
        this.message,
        this.doctor,
    });

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "doctor": doctor?.toJson(),
    };
}

class Doctor {
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? email;
    final bool? confirmEmail;
    final dynamic emailCode;
    final bool? verifyEmail;
    final dynamic emailPasswordCode;
    final String? password;
    final String? clinicAddress;
    final String? phoneOne;
    final String? phoneTwo;
    final UnionCard? unionCard;
    final Certificate? certificate;
    final String? specialization;
    final bool? isApproved;
    final bool? isLogin;
    final String? status;
    final List<String>? patientId;
    final String? role;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    Doctor({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.confirmEmail,
        this.emailCode,
        this.verifyEmail,
        this.emailPasswordCode,
        this.password,
        this.clinicAddress,
        this.phoneOne,
        this.phoneTwo,
        this.unionCard,
        this.certificate,
        this.specialization,
        this.isApproved,
        this.isLogin,
        this.status,
        this.patientId,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Doctor.fromRawJson(String str) => Doctor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        confirmEmail: json["confirmEmail"],
        emailCode: json["emailCode"],
        verifyEmail: json["verifyEmail"],
        emailPasswordCode: json["EmailPasswordCode"],
        password: json["password"],
        clinicAddress: json["clinicAddress"],
        phoneOne: json["phone_one"],
        phoneTwo: json["phone_two"],
        unionCard: json["unionCard"] == null ? null : UnionCard.fromJson(json["unionCard"]),
        certificate: json["certificate"] == null ? null : Certificate.fromJson(json["certificate"]),
        specialization: json["specialization"],
        isApproved: json["isApproved"],
        isLogin: json["isLogin"],
        status: json["status"],
        patientId: json["patientId"] == null ? [] : List<String>.from(json["patientId"]!.map((x) => x)),
        role: json["role"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "confirmEmail": confirmEmail,
        "emailCode": emailCode,
        "verifyEmail": verifyEmail,
        "EmailPasswordCode": emailPasswordCode,
        "password": password,
        "clinicAddress": clinicAddress,
        "phone_one": phoneOne,
        "phone_two": phoneTwo,
        "unionCard": unionCard?.toJson(),
        "certificate": certificate?.toJson(),
        "specialization": specialization,
        "isApproved": isApproved,
        "isLogin": isLogin,
        "status": status,
        "patientId": patientId == null ? [] : List<dynamic>.from(patientId!.map((x) => x)),
        "role": role,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Certificate {
    final String? secureUrl;
    final String? publicId;

    Certificate({
        this.secureUrl,
        this.publicId,
    });

    factory Certificate.fromRawJson(String str) => Certificate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        secureUrl: json["secure_url"],
        publicId: json["public_id"],
    );

    Map<String, dynamic> toJson() => {
        "secure_url": secureUrl,
        "public_id": publicId,
    };
}

class UnionCard {
    final String? url;

    UnionCard({
        this.url,
    });

    factory UnionCard.fromRawJson(String str) => UnionCard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UnionCard.fromJson(Map<String, dynamic> json) => UnionCard(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
