import 'package:e_commerce_app/models/request/Register_request.dart';
import 'package:e_commerce_app/repository/auth_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  var firstName = TextEditingController().obs;
  var lastName = TextEditingController().obs;
  var username = TextEditingController().obs;
  var email = TextEditingController().obs;
  var phoneNumber = TextEditingController().obs;
  var password = TextEditingController().obs;
  var confirmPassword = TextEditingController().obs;
  var gender = true.obs;

  var registerRequest = RegisterRequest().obs;
  var authRepo = AuthRepositoryImpl().obs;

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  onRegister() async {
    if (username.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your username");
      return;
    }
    if (phoneNumber.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your phone");
      return;
    }
    if (email.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    }
    if (password.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your password");
      return;
    }
    if (confirmPassword.value.text != password.value.text) {
      Get.snackbar("Error", "Confirm password does not match");
      return;
    }

    loading.value = true;

    registerRequest.value.firstName = firstName.value.text;
    registerRequest.value.lastName = lastName.value.text;
    registerRequest.value.username = username.value.text;
    registerRequest.value.phoneNumber = phoneNumber.value.text;
    registerRequest.value.email = email.value.text;
    registerRequest.value.password = password.value.text;
    registerRequest.value.confirmPassword = confirmPassword.value.text; // FIXED
    registerRequest.value.profile = "";
    registerRequest.value.role = "USER";
    registerRequest.value.gender = gender.value ? "M" : "F";


    var res = await authRepo.value.register(registerRequest.value);

    loading.value = false;

    if (res.code == "200") {
      Get.back();
      Get.snackbar("Success", res.message ?? "Register success");
    } else {
      Get.snackbar("Error", res.message ?? "Register failed");
    }
  }
}



// import 'package:e_commerce_app/models/request/Register_request.dart';
// import 'package:e_commerce_app/repository/auth_repository_impl.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// class RegisterViewModel extends GetxController{
//  var firstName = TextEditingController().obs;
//  var lastName = TextEditingController().obs;
//  var username = TextEditingController().obs;
//  var email = TextEditingController().obs;
//  var phoneNumber = TextEditingController().obs;
//  var password = TextEditingController().obs;
//  var confirmPassword = TextEditingController().obs;
//  var gender = true.obs;
//    var registerRequest = RegisterRequest().obs;
//    var authRopo = AuthRepositoryImpl().obs;
//   var loading = false.obs;
//  @override
//   void onInit() {
//
//     super.onInit();
//   }
//   onRegister() async {
//     if(username.value.text.isEmpty){
//       Get.snackbar("Error","Please enter your username");
//       return;
//     }
//     if(phoneNumber.value.text.isEmpty){
//       Get.snackbar("Error","Please enter your phone");
//       return;
//     }
//     if(email.value.text.isEmpty){
//       Get.snackbar("Error","Please enter your email");
//     }
//     if(password.value.text.isEmpty){
//       Get.snackbar("Error","Please enter your password");
//       return;
//     }
//     if(confirmPassword.value.text != password.value.text){
//       Get.snackbar("Error","Confirm password is not match");
//       return;
//     }
//     loading.value = loading true;
//     registerRequest.value.firstName = firstName.value.text;
//     registerRequest.value.Lastname = firstName.value.text;
//
//     registerRequest.value.username = username.value.text;
//     registerRequest.value.phoneNumber = phoneNumber.value.text;
//     registerRequest.value.email = email.value.text;
//     registerRequest.value.password = password.value.text;
//     registerRequest.value.profile = "";
//     registerRequest.value.role ="USER";
//     var res = await  authRopo.register(registerRequest.value);
//     if(res.code =="200"){
//       Get.back();
//       Get.snackbar("Success", res.message?? "Register success");
//     }else{
//       Get.snackbar("Error", res.message?? "Error Register success");
//     }
//
//
//     loading.value = loading; false;
//
//
//   }
// }