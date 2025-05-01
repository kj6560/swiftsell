import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:swiftsell/utility/data_storage.dart';
import 'package:swiftsell/utility/showLoading.dart';

import 'constants/app_constants.dart';
import 'constants/routes.dart';
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );


  await DataStorage.init();
  runApp(
    GetMaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primaryColor),
        fontFamily: 'Billions',
        useMaterial3: true,
      ),
      initialRoute: '/home',
      getPages: AppRoutes.routes,
      // Use the routes defined in AppRoutes
      home: MySudoHome(),
      // internet connection check
      builder: (context, child) {
        return StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              ConnectivityResult? result = snapshot.data?.first;
              return Column(
                children: [
                  Visibility(
                    visible: result != ConnectivityResult.mobile &&
                        result != ConnectivityResult.wifi,
                    child: Material(
                      child: SafeArea(
                        child: Container(
                          color: Colors.red,
                          height: 30,
                          child: Center(
                            child: Text(
                              "No Internet Connection",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: child!),
                ],
              );
            });
      },
    ),
  );

}

class MySudoHome extends StatefulWidget {
  const MySudoHome({super.key});

  @override
  State<MySudoHome> createState() => _MySudoHomeState();
}

class _MySudoHomeState extends State<MySudoHome> with TickerProviderStateMixin {
  // RI.Intent? _initialIntent;

  @override
  void initState() {
    isReady();
    super.initState();
    // _init();
  }



  void isReady() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String? loggedout = DataStorage.retrieve("loggedout");
    if (packageInfo.version != '1.0.0' &&
        (loggedout == '' || loggedout == null)) {
      logout();
    }
    var _token = DataStorage.retrieve("token");
    print(_token);
    if (_token != null && _token.isNotEmpty) {
      Get.offAllNamed("/home");
    } else {
      Get.offAllNamed("/login");
    }
  }

  void logout() async {
    DataStorage.clear();
    DataStorage.store("loggedout", "done");
    //RemoteServices.logoutUser(getUser()?.id);
    Get.offAllNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: showLoading(),
    );
  }
}
