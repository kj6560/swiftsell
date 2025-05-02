import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:http/http.dart';
import 'dart:convert';

import '../utility/get_token.dart';
import 'base_url.dart';

class AppConstants {
  static const String appName = "UNIV";

  static const Color primaryColor = Color.fromRGBO(26, 188, 156, 70);
  static const Color esportsBackgroundColor =
  Color.fromRGBO(28, 33, 32, 40);
  static const Color sportsBackgroundColor =
  Color.fromRGBO(239, 245, 241, 40);
  static const Color disabledColor = Color.fromRGBO(19, 146, 127, 0.3);
  static const String passwordPolicy = """
1. the password contains at least one uppercase letter (A-Z).
2. the password contains at least one lowercase letter (a-z).
3. the password contains at least one digit (0-9).
4. the password contains at least one special character from the provided set (!@#\$&*~).
5. the password is at least 8 characters long.
  """;

  static const String registrationInstructions = """
Athletics : Instructions for participants registering for athletics event

Gender: Men//Women
Age: Under 15//Under 17// Under 20 (for both Men and Women)
Under each age group

Event Category
100 m
200 m
400 m
800 m
1500 m
5000 m
10,000 m
110 m hurdles
400 m hurdles
3000 m steeplechase
4 × 100 m relay
4 × 400 m relay
Long jump
Triple jump
High jump
Pole vault
Shot put
Discus throw
Hammer throw
Javelin throw
Pentathlon
Heptathlon
Decathlon
  """;

  static Future<List<dynamic>> fetchData(String url) async {
    var token = getToken();
    String urL = '$baseUrl$url';
    final response = await get(Uri.parse(urL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      // If the API call was successful, parse the JSON response

      return json.decode(response.body);
    } else {
      // If the API call was unsuccessful, throw an error
      throw Exception('Failed to load data');
    }
  }

  static void cacheFile(String url) {
    final cache = DefaultCacheManager();
    cache.getSingleFile(url);
  }

  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  static Future<void> checkAndRequestPermissions() async {
    if (await Permission.camera.request().isGranted &&
        await Permission.storage.request().isGranted) {}
  }
}
