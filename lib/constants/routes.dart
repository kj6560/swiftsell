import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:swiftsell/views/Customers.dart';
import 'package:swiftsell/views/Home.dart';
import 'package:swiftsell/views/Inventory.dart';
import 'package:swiftsell/views/Login.dart';
import 'package:swiftsell/views/Orders.dart';
import 'package:swiftsell/views/Products.dart';
import 'package:swiftsell/views/Schemes.dart';

class AppRoutes {
  static const transition = Transition.rightToLeft;

  static final List<GetPage> routes = [

    GetPage(
      name: '/home',
      page: () => Home(),
      transition: transition,
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
      transition: transition,
    ),
    GetPage(
      name: '/products',
      page: () => Products(),
      transition: transition,
    ),
    GetPage(
      name: '/inventory',
      page: () => Inventory(),
      transition: transition,
    ),
    GetPage(
      name: '/orders',
      page: () => Orders(),
      transition: transition,
    ),
    GetPage(
      name: '/customers',
      page: () => Customers(),
      transition: transition,
    ),
    GetPage(
      name: '/schemes',
      page: () => Schemes(),
      transition: transition,
    ),
  ];
}
