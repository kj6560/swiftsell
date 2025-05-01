import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../constants/base_url.dart';

import '../utility/get_token.dart';
import '../utility/my_validator.dart';

class RemoteServices {
  static Future<bool> hasInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  static var client = http.Client();

  static Future<Map<String, dynamic>?> login(
    String emailOrPhone,
    String password,
  ) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    bool isEmail = MyValidator.isValidEmail(emailOrPhone);
    // Encode parameters into the URL
    final uri = Uri.parse(
      '${baseUrl}/api/login',
    ).replace(queryParameters: {'email': emailOrPhone, 'password': password});

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseObject = json.decode(response.body);
      return responseObject;
    } else {
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      return {
        'error': true,
        'message': errorResponse['message'] ?? 'Failed to login',
      };
    }
  }
}
