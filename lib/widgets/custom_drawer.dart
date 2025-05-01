import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String email;
  final String profileImageUrl;

  const CustomDrawer({
    super.key,
    required this.userName,
    required this.email,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer header with gradient background
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Drawer menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Get.offAllNamed('/home');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Products'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Get.toNamed('/products');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Inventory'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Get.toNamed('/inventory');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Orders'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Get.toNamed('/orders');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Customers'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Get.toNamed('/customers');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Schemes'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    Get.toNamed('/schemes');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    // Clear user data, token, etc.
                    Get.offAllNamed('/login');
                  },
                ),
              ],
            ),
          ),
          // Company declaration fixed at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '© 2025 Your Company Name\nAll rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
