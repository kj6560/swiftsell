import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final String userName;
  final String email;
  final String profileImageUrl;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.userName,
    required this.email,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white), // <-- makes drawer icon white
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
      drawer: CustomDrawer(
        userName: userName,
        email: email,
        profileImageUrl: profileImageUrl,
      ),
      body: body,
    );
  }
}
