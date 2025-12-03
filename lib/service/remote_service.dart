import 'package:e_commerce_app/models/api_base_response.dart';

abstract class RemoteService{
  Future<ApiBaseResponse> postApi({required String uri, required body});
  Future<dynamic>postAppWithToken({required String url,required dynamic body});
}