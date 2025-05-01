import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftsell/controllers/HomeController.dart';

import '../widgets/base_scaffold.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Home",
      body: Center(child: Text('Welcome to Home')),
      userName: "userName",
      email: "email",
      profileImageUrl: "profileImageUrl",
    );
  }
}
