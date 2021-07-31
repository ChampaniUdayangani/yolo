import 'dart:convert';

import 'package:yolo/core/data/constants/app_constants.dart';
import 'package:yolo/core/services/networking/http_service.dart';
import 'package:yolo/core/services/utility_services/shared_preferences_service.dart';
import 'package:yolo/models/login_model.dart';
import 'package:yolo/utils/storage_keys.dart';

const login_url = '$appUrl/login';

class LoginService {
  HttpService httpService = HttpService();
  StorageKeys storage = StorageKeys();
  String token = '';

  String get getToken => token;

  Future<dynamic> login(String userEmail, String userPassword) async {
    try {
      Login loginData = Login(email: userEmail, password: userPassword);

      var response = await httpService.post(login_url, jsonEncode(loginData));

      var storage = await SharedPrefsService.getInstance();
      storage.saveToDisk('ACCESS_TOKEN', response?.data['token']);

      return response;
    } catch (e) {
      print('inside ${e}');
      return ('Error occured: $e');
    }
  }
}
