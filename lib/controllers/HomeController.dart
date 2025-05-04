import 'package:get/get.dart';
import 'package:swiftsell/services/remote_services.dart';

import '../models/home_kpi.dart';
import '../utility/get_user.dart';

class HomeController extends GetxController {
  Rx<HomeKpi> homeKpi = HomeKpi.empty().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeKpis();
  }

  void fetchHomeKpis() async {
    isLoading.value = true; // Start loading

    try {
      var response = await RemoteServices.fetchHomeKpis();
      homeKpi.value = response!;
    } catch (e) {
      print('error for coin balance = $e');
    } finally {
      isLoading.value = false; // End loading
    }
  }
}
