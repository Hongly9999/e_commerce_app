class ApiBaseResponse{
  bool? isSuccess;
  String? message;
  String? errorCode;
  dynamic data;

  ApiBaseResponse({this.data, this.message, this.isSuccess,this.errorCode});
}