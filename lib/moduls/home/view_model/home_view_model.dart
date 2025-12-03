import 'package:e_commerce_app/data/local/user_data_local_storage.dart';
import 'package:e_commerce_app/models/response/User.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  var user = User().obs;
  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }
  getUserInfo(){
    var userInfo = UserDataLocalStorage.getUserInformation();
    user.value.email = userInfo.email??"";
    user.value.username = userInfo.username??"";
    user.value.phoneNumber= userInfo.phoneNumber??"";

  }
}