import 'package:e_commerce_app/data/local/user_data_local_storage.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:e_commerce_app/repository/auth_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController{
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var username = "".obs;
  var password = "".obs;
  var enablePassword = true.obs;
  var authRepository = AuthRepositoryImpl();
  var loadingLogin = false.obs;
  @override
  void onInit() {
    super.onInit();
  }
 onChangeValueUsername(String value){
    username.value = value;
 }
  onChangeValuePassword(String value){
    password.value = value;
  }
  onEnablePassword(value){
    enablePassword.value = value;
  }
  onLogin() async{
    username.value = usernameController.value.text;
    password.value = passwordController.value.text;
    if(username.isEmpty){
      showMessageError("Username is required");
      return;
    }
    if(password.isEmpty){
    showMessageError("Password is required");
    return;
    }
    loadingLogin.value = true;
    var loginRes = await authRepository.login(username.value, password.value);
    if(loginRes.accessToken != null){
      Get.offAllNamed("/splash");
      showMessageSuccess ("Login Successfully");
      UserDataLocalStorage.saveUserInformation(user: loginRes.user,token: loginRes.accessToken,refresh: loginRes.refreshToken);
    }else{
      showMessageError("You username and password incorrect");
    }
    loadingLogin.value = false;

  }
  showMessageError(String message){
    Get.snackbar("Error",
      message,
      backgroundColor:Colors.red,
      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 16),

    );

  }
  showMessageSuccess(String message) {
    Get.snackbar("Success",
      message,
      backgroundColor: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 16),

    );
  }
}