import 'package:flutter/material.dart';
import 'package:swiftsell/viewContents/NewProductContent.dart';

import '../widgets/base_scaffold.dart';
class NewProduct extends StatelessWidget {
  const NewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "New Product",
      body: NewProductContent(),
    );
  }
}
