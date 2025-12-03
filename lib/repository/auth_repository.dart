import 'package:e_commerce_app/models/request/Register_request.dart';
import 'package:e_commerce_app/models/response/App_api_response.dart';
import 'package:e_commerce_app/models/response/Login_response.dart';

abstract class AuthRepository{
Future<LoginResponse>login(String username, String password);
Future<AppApiResponse>register(RegisterRequest req);
}