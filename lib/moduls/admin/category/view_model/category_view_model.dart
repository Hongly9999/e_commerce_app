import 'dart:convert';

import 'package:e_commerce_app/models/request/Base_request.dart';
import 'package:e_commerce_app/models/response/App_api_response.dart';
import 'package:e_commerce_app/moduls/admin/category/model/Category_model.dart';
import 'package:e_commerce_app/moduls/admin/category/model/Category_model_request.dart';
import 'package:e_commerce_app/service/constant_uri.dart';
import 'package:e_commerce_app/service/remote_service_impl.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  var categoryList = <CategoryModel>[];
  var isLoading = false.obs;
  var serviceApi = RemoteServiceImpl();
  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  getAllCategories() async{
    isLoading.value = true;
    var response = await serviceApi.postAppWithToken(
        url: ConstantUri.adminCategoryPath, body:jsonEncode(BaseRequest().toJson()));
        if(response != null){
          var appResponse = AppApiResponse.fromJson(jsonDecode(response));
         print(response);
         categoryList = [];
         appResponse.data.forEach((data){
           categoryList.add(
             CategoryModel.fromJson(data)
           );
         });
        }

    isLoading.value = false;
  }
  getCategoryById(int id) async{
    var response = await serviceApi.postAppWithToken(url: ConstantUri.adminGetCategoryByIdPath+"${id}", body: jsonEncode(BaseRequest().toString()));
    if(response != null){
      var appRes = AppApiResponse.fromJson(jsonDecode(response));
      if(appRes.data != null){
        var category = CategoryModelRequest.fromJson(appRes.data);
        Get.toNamed("/admin/categories/form",parameters: {"id":"${category.id}","name":"${category.name}"});
      }
    }
  }
}
