import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftsell/controllers/HomeController.dart';
import 'package:swiftsell/viewContents/HomeContent.dart';

import '../widgets/base_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
    return BaseScaffold(
      title: "Home",
      body: HomeContent(),
    );
  }
}
