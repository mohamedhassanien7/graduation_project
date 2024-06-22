import 'dart:convert';
import 'dart:io';
import 'package:care_brecelet/models/doctor_auth_model.dart';
import 'package:care_brecelet/models/guardian_auth_model.dart';
import 'package:care_brecelet/models/patient_auth_model.dart';
import 'package:care_brecelet/models/patient_model.dart';
import 'package:care_brecelet/models/patients_model.dart';
import 'package:care_brecelet/models/profile_model.dart';
import 'package:care_brecelet/models/seizure_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiManager {
  static const String baseUrl = "https://projectcare.vercel.app";
  static var dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );
  static Future<dynamic> login(
      String email, String password, String role) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    try {
      var response = await dio.post(
        role,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          validateStatus: (status) => true,
        ),
      );
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['access_Token']);

      if (role == '/doctor/loginDoctor') {
        return DoctorAuthModel.fromJson(response.data);
      } else if (role == '/patient/loginPatient') {
        return PatientAuthModel.fromJson(response.data);
      } else {
        return GuardianAuthModel.fromJson(response.data);
      }
    } catch (e) {
      print('==================');
      print(e);
    }
  }

  static Future<DoctorAuthModel> register(
      String email,
      String password,
      String cPassword,
      String gender,
      String phone,
      String phone2,
      String address,
      String birthDate,
      String firstName,
      String lastName,
      String role) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.post(
      role,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "cPassword": cPassword,
        "gender": gender,
        "phone_one": phone,
        "phone_two": phone2,
        "homeAddress": address,
        "birthDate": birthDate,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> registerDoctor(
      String email,
      String password,
      String phone,
      String phone2,
      String address,
      File unionCard,
      String specialization,
      File certificate,
      String firstName,
      String lastName,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.post(
      '/doctor/signupDoctor',
      data: FormData.fromMap({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "cPassword": password,
        "phone_one": phone,
        "phone_two": phone2,
        "clinicAddress": address,
        "unionCard": await MultipartFile.fromFile(
          unionCard.path,
        ),
        "certificate": await MultipartFile.fromFile(
          certificate.path,
        ),
        "specialization": specialization,
      }),
      options: Options(
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> forgetPassword(
      String email,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.post(
      role,
      data: {
        "email": email,
      },
      options: Options(
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> verifyEmail(
      String email,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.patch(
      role,
      data: {
        "email": email,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> verifyCode(
      String code,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.put(
      role,
      data: {
        "EmailPasswordCode": code,
      },
      options: Options(
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> resetPassword(
      String password,
      String cPassword,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.patch(
      role,
      data: {
        "newPassword": password,
        "cNewPassword": cPassword,
      },
      options: Options(
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<PatientsModel> getPatients() async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.get(
      '/doctor/getPatients',
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return PatientsModel.fromJson(response.data);
  }

  static Future<ProfileModel> getDoctorProfile() async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.get(
      '/doctor/home/profile',
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return ProfileModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> setComplaint(
      String complaint,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.post(
      role,
      data: {
        "complaint": complaint,
      },
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> deleteAccount(
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.delete(
      role,
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> updateProfile(
      String firstName,
      String lastName,
      String email,
      String phone,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.put(
      role,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone_one": phone,
      },
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> confirmEmail(
      String code,
      String role,
      ) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var response = await dio.put(
      role,
      data: {
        "emailCode": code,
      },
      options: Options(
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<PatientModel> getPatientData(BuildContext context) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var data = ModalRoute.of(context)?.settings.arguments as PatientSeizure?;
    print(data);
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.get(
      '/doctor/getOnePatient/${data?.id}',
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return PatientModel.fromJson(response.data);
  }

  static Future<SeizureModel> getHistorySeizure() async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.get(
      '/doctor/getHistory',
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return SeizureModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> scanQrGurdian(String url) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await Dio().post(
      url,
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> scanQrDoctor(String url) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await Dio().patch(
      url,
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }

  static Future<DoctorAuthModel> saveToken(
      String role, String tokenNotify) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await dio.post(
      '/$role/saveToken',
      data: {
        "Token": tokenNotify,
      },
      options: Options(
        headers: {
          'Authorization': 'Hamada__$token',
        },
        validateStatus: (status) => true,
      ),
    );
    return DoctorAuthModel.fromJson(response.data);
  }
  ////////////location /////////////////////////////

  static Future<dynamic> maps(
      String roleMaps,
      String lat,  String lng) async {
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await dio.post(
        roleMaps,
        data: {
          'lat': lat,
          'lng': lng,
        },
        options: Options(
          headers: {
            'Authorization': 'Hamada__$token',
          },
          validateStatus: (status) => true,
        ),
      );
      var prefss = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['access_Token']);
      if (roleMaps == '$baseUrl/patient/sendLocation') {
        return DoctorAuthModel.fromJson(response.data);
        // } else if (role == '/patient/loginPatient') {
        //   return PatientAuthModel.fromJson(response.data);
        // } else {
        //   return GuardianAuthModel.fromJson(response.data);
        // }

      }

    }
    catch (e) {
      print('==================');
      print(e);
    }
  }
}
