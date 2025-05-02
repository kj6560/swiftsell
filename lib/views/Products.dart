import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftsell/controllers/ProductController.dart';
import 'package:swiftsell/viewContents/ProductHomeContent.dart';

import '../widgets/base_scaffold.dart';
class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProductController>()) {
      Get.put(ProductController());
    }
    return BaseScaffold(
      title: "Products",
      body: ProductHomeContent(),
    );
  }
}
