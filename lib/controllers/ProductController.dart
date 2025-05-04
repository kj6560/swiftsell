import 'package:get/get.dart';
import 'package:swiftsell/utility/get_user.dart';

import '../constants/endpoints.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../services/remote_services.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = List<ProductModel>.empty().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isLoading.value = true;

    User? user = getUser();
    try {
      var response = await RemoteServices.fetchProducts(user!.orgId);
      print(response);
      products.value = response!;
    } catch (e) {
      print('error for products = $e');
    } finally {
      isLoading.value = false;
    }
  }
}
