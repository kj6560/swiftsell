import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/my_dialogs.dart';
import '../models/user_model.dart';
import '../services/remote_services.dart';
import '../utility/data_storage.dart';
import '../utility/update_user.dart';

class LoginController extends GetxController{
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool enableLoginButton = true.obs;
  RxBool isLoading = false.obs;
  RxString version = "".obs;
  RxInt platform = 1.obs;
  Map<String, dynamic>? _userData;
  final RxBool _checking = true.obs;
  Map<String, dynamic>? userData;
  @override
  void onInit() {
    super.onInit();
    getAppVersion();
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
    platform.value = Platform.isAndroid ? 1 : 2;
  }
  void updateLoginButtonState() {
    if (passwordController.text.length >= 8) {
      enableLoginButton.value = false;
    } else {
      enableLoginButton.value = true;
    }
  }
  Future<String> login(var context) async {
    if (!loginFormKey.currentState!.validate()) {
      return "";
    }
    isLoading.value = true;
    var returnData = "";
    try {
      String email = emailOrPhoneController.text;
      String password = passwordController.text;

      var response = await RemoteServices.login(email, password);
      print(response);
      if (response!['statusCode'] == 200) {
        final Map<String, dynamic> data = response['data'];
        final Map<String, dynamic> userObj = data['user'];

        DataStorage.store("token", data['token']);
        updateUser(User.fromJson(userObj));

        returnData = "";
        Get.offAllNamed("/home");
      } else {
        returnData = response["message"];
        MyDialogs.showMsgDialog("Error", returnData, context, () {
          Get.back();
        });
      }
    } catch (e) {
      MyDialogs.showInternetErrorDialog("Login", e, context);
    } finally {
      isLoading.value = false;
    }
    return returnData;
  }

}