import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton; // Optional FAB

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: body,
      floatingActionButton: floatingActionButton, // FAB here
    );
  }
}
