import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
        BaseOptions(
          baseUrl:'https://projectcare.vercel.app/' ,
          receiveDataWhenStatusError: true,

        )
    );
  }

  static Future<Response> GetData (
      {
        required String url,
        Map<String,dynamic>? query,
        String? lang='en',
        String? token
      }
      )async{
    dio.options.headers={

      'Authorization':token
    };

    return await dio.get(url,queryParameters: query);
  }


  static Future<Response> PostData (
      {
        required String url,
        Map<String,dynamic>? query,
        Map<String,dynamic>? data,
        String? lang='en',
        String? token,
      }
      )async{
    dio.options.headers={

      'Authorization':token
    };

    return await dio.post(url,queryParameters: query,data: data);
  }

  static Future<Response> PostData1 (
      {
        required String url,
        Map<String,dynamic>? query,
        Map<String,dynamic>? data,
        String? lang='en',
        String? token,
      }
      )async{

    return await dio.post(url,queryParameters: query,data: data);
  }


  static Future<Response> PutData({
    required String url,
    required Map<String,dynamic>data,
    String? token,
    String? lang,
    Map<String,dynamic>? query,
  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang': lang,
      'Authorization':token
    };

    return await dio.put(url,queryParameters: query,data: data);
  }
}