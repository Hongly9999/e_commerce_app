// class BaseRequest {
//   BaseRequest({
//       this.limit=1000,
//       this.page=1,
//       this.userId=0,
//       this.status="ACT",
//       this.id=0,});
//
//   BaseRequest.fromJson(dynamic json) {
//     limit = json['limit'];
//     page = json['page'];
//     userId = json['userId'];
//     status = json['status'];
//     id = json['id'];
//   }
//   int? limit;
//   int? page;
//   int? userId;
//   String? status;
//   int? id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['limit'] = limit;
//     map['page'] = page;
//     map['userId'] = userId;
//     map['status'] = status;
//     map['id'] = id;
//     return map;
//   }
//
// }

class BaseRequest {
  int limit;
  int page;
  int userId;
  String status;
  int id;

  BaseRequest({
    this.limit = 1000,
    this.page = 1,
    this.userId = 0,
    this.status = "ACT",
    this.id = 0,
  });

  factory BaseRequest.fromJson(Map<String, dynamic> json) {
    return BaseRequest(
      limit: json['limit'] ?? 1000,
      page: json['page'] ?? 1,
      userId: json['userId'] ?? 0,
      status: json['status'] ?? "ACT",
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'page': page,
      'userId': userId,
      'status': status,
      'id': id,
    };
  }
}
