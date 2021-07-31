import 'package:dio/dio.dart';
import 'package:yolo/core/services/networking/failure.dart';

class HttpService {
  static BaseOptions opts = BaseOptions(
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static final dio = createDio();

  Future<Response?> get(String url) async {
    try {
      Response response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      throw Failure(e.message);
    }
  }

  Future<Response?> post(
    String url,
    dynamic data,
  ) async {
    try {
      Response response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      throw Failure(e.message);
    }
  }

  Future<Response?> put(String url, dynamic data) async {
    try {
      Response response = await dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      throw Failure(e.message);
    }
  }

  Future<Response?> delete(String url) async {
    try {
      Response response = await dio.delete(url);
      return response;
    } on DioError catch (e) {
      throw Failure(e.message);
    }
  }
}
