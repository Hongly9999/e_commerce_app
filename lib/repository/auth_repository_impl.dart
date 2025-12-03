import 'dart:convert';

import 'package:e_commerce_app/models/request/Login_request.dart';
import 'package:e_commerce_app/models/request/Register_request.dart';
import 'package:e_commerce_app/models/response/App_api_response.dart';
import 'package:e_commerce_app/models/response/Login_response.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:e_commerce_app/service/constant_uri.dart';
import 'package:e_commerce_app/service/remote_service_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  final serviceApi = RemoteServiceImpl();
  @override
  Future<LoginResponse> login(String username, String password) async {
    LoginResponse loginResponse = LoginResponse();
    var response = await serviceApi.postApi(
      uri: ConstantUri.loginPath,
      body: jsonEncode(
        LoginRequest(phoneNumber: username, password: password).toJson(),
      ),
    );
    if (response.isSuccess == true) {
      return LoginResponse.fromJson(jsonDecode(response.data));
    }
    return loginResponse;
  }

  @override
  Future<AppApiResponse> register(RegisterRequest req) async {
    AppApiResponse apiResponse = new AppApiResponse();
    var response = await serviceApi.postApi(
      uri: ConstantUri.registerPath,
      body: jsonEncode(req.toJson()),
    );
    if(response.message != null){
      apiResponse = AppApiResponse.fromJson(jsonDecode(response.data));
    }
    return apiResponse;
  }
}
