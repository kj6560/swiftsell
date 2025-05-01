import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:swiftsell/views/Home.dart';
import 'package:swiftsell/views/Login.dart';

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
  ];
}
