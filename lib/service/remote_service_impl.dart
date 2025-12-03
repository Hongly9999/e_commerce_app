import 'dart:convert';

import 'package:e_commerce_app/data/local/user_data_local_storage.dart';
import 'package:e_commerce_app/models/api_base_response.dart';
import 'package:e_commerce_app/models/request/Refresh_token_request.dart';
import 'package:e_commerce_app/models/response/Login_response.dart';
import 'package:e_commerce_app/service/constant_uri.dart';
import 'package:e_commerce_app/service/remote_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as httpClient;

class RemoteServiceImpl extends RemoteService {
  @override
  Future<ApiBaseResponse> postApi({
    required String uri,
    required dynamic body,
  }) async {
    final responseBody = ApiBaseResponse();

    if (kDebugMode) {
      print("Interception request uri{} $uri and body request {} : $body");
    }

    try {
      final response = await httpClient
          .post(
            Uri.parse(uri),
            body: body,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          )
          .timeout(const Duration(seconds: 120));

      if (response.statusCode == 200) {
        responseBody.isSuccess = true;
        responseBody.errorCode = "${response.statusCode}";
        responseBody.message = "Success";
        responseBody.data = response.body;

        if (kDebugMode) {
          print("Response body: ${response.body}");
        }
      } else {
        responseBody.isSuccess = false;
        responseBody.errorCode = "${response.statusCode}";
        responseBody.message = "Error";
      }
    } catch (e) {
      responseBody.isSuccess = false;
      responseBody.errorCode = "Exception";
      responseBody.message = e.toString();

      if (kDebugMode) {
        print("PostApi Exception: $e");
      }
    }

    return responseBody;
  }

  @override
  Future postAppWithToken({required String url, required body}) async {
    if (kDebugMode) {
      print("Intercept request url $url and body request $body");
    }
    dynamic responseBody;
    var response = await httpClient
        .post(
          Uri.parse(url),
          body: body,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataLocalStorage.getAccessToken()}",
          },
        )
        .timeout(Duration(seconds: 120));
    if (response.statusCode == 401) {
      if (await refreshToken() == true) {
        return await _retry(url: url, body: body);
      } else {
        Get.offAllNamed("/splash");
        UserDataLocalStorage.removeAccessToken();
        UserDataLocalStorage.removeAccessToken();
        UserDataLocalStorage.removeUserInformation();
      }
    } else if (response.statusCode == 200) {
      responseBody = response.body;
    } else {
      responseBody = response.body;
    }
    return responseBody;
  }

  Future<bool> refreshToken() async {
    var refreshToken =UserDataLocalStorage.getRefreshToken();
    print("REFRESH TOKEN ${refreshToken}");
    var response = await httpClient.post(
      Uri.parse(ConstantUri.refreshTokenPath),
      body: jsonEncode(
        new RefreshTokenRequest(
          refreshToken: refreshToken,
        ).toJson(),
      ),
      headers: {"Content-Type" :"application/json"}
    );
    if (response.statusCode == 200) {
      var responseRefreshToken = LoginResponse.fromJson(jsonDecode(response.body));
      UserDataLocalStorage.saveUserInformation(
        user: responseRefreshToken.user,
        token: responseRefreshToken.accessToken,
        refresh: responseRefreshToken.refreshToken,
      );

      return true;
    }
    return false;
  }

  Future _retry({required String url, required body}) async {
    if (kDebugMode) {
      print("Intercept retry request url $url and body request $body");
    }
    dynamic responseBody;
    var response = await httpClient
        .post(
          Uri.parse(url),
          body: body,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataLocalStorage.getAccessToken()}",
          },
        )
        .timeout(Duration(seconds: 120));

    if (response.statusCode == 200) {
      responseBody = response.body;
    } else {
      responseBody = response.body;
    }
    return responseBody;
  }
}
