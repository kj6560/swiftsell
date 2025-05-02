import 'package:get/get.dart';
import 'package:swiftsell/models/user_model.dart';
import 'package:swiftsell/utility/get_user.dart';

class MyDrawerController extends GetxController{
  RxString user_name = "".obs;
  RxString email = "".obs;
  RxString profilePicImage = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeUser();
  }

  void initializeUser() async{
    User? user = getUser();
    if(user !=null){
      user_name.value = user.name;
      email.value = user.email;
      profilePicImage.value = user.profilePic!;
      refresh();
    }
  }
}