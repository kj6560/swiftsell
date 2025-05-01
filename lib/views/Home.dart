import 'package:flutter/material.dart';

import '../widgets/base_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: "Home",
      body: Center(child: Text('Welcome to Home')),
    );
  }
}
