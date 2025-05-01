import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
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
        title: Text(title,style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const CustomDrawer( userName: 'Keshav jha', email: 'kj6560@gmail.com', profileImageUrl: '',),
      body: body,
    );
  }
}
