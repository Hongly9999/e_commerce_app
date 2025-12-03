import 'dart:convert';

import 'package:e_commerce_app/models/request/Base_request.dart';
import 'package:e_commerce_app/models/response/App_api_response.dart';
import 'package:e_commerce_app/moduls/admin/category/model/Category_model.dart';
import 'package:e_commerce_app/moduls/admin/category/model/Category_model_request.dart';
import 'package:e_commerce_app/service/constant_uri.dart';
import 'package:e_commerce_app/service/remote_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryFormViewModel extends GetxController{
 var categoryNameController = TextEditingController().obs;
 var createLoading = false.obs;
 var categoryRequest = CategoryModelRequest().obs;
 var service = RemoteServiceImpl();
  @override
  void onInit() {
    var id = int.parse(Get.parameters["id"] ?? "0");
    if(id != 0){
      var name = Get.parameters["name"]??"";
      categoryNameController.value.text = name;
      categoryRequest.value.id = id;
      categoryRequest.value.name = name;
    }
    super.onInit();
  }
  Future<void> onCreateCategory()async{
    var categoryName = categoryNameController.value.text;
    if(categoryName.isEmpty){
      Get.snackbar("Error", "Category is required");
      return;
    }
    createLoading.value = true;
    categoryRequest.value.name = categoryName;
    var response = await service.postAppWithToken(url: ConstantUri.adminCreateCategoryPath, body: jsonEncode(categoryRequest.value.toJson()));
    if(response != null){
      var res = AppApiResponse.fromJson(jsonDecode(response));
      if(res.code =="SUC-000"){
        Get.back(result: true);
        Get.snackbar("Success", res.message??"");
      }else{
        Get.snackbar("Error", res.message??"");
      }
    }
  }

}

