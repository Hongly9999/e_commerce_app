import 'Roles.dart';

class User {
  User({
      this.createBy, 
      this.updateAt, 
      this.updateBy, 
      this.id, 
      this.username, 
      this.firstname, 
      this.lastname, 
      this.email, 
      this.verifyEmail, 
      this.phoneNumber, 
      this.status, 
      this.profile, 
      this.changePassword, 
      this.roles,});

  User.fromJson(dynamic json) {
    createBy = json['createBy'];
    updateAt = json['updateAt'];
    updateBy = json['updateBy'];
    id = json['id'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    verifyEmail = json['verifyEmail'];
    phoneNumber = json['phoneNumber'];
    status = json['status'];
    profile = json['profile'];
    changePassword = json['changePassword'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }
  String? createBy;
  dynamic updateAt;
  dynamic updateBy;
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  dynamic verifyEmail;
  String? phoneNumber;
  String? status;
  String? profile;
  String? changePassword;
  List<Roles>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createBy'] = createBy;
    map['updateAt'] = updateAt;
    map['updateBy'] = updateBy;
    map['id'] = id;
    map['username'] = username;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['email'] = email;
    map['verifyEmail'] = verifyEmail;
    map['phoneNumber'] = phoneNumber;
    map['status'] = status;
    map['profile'] = profile;
    map['changePassword'] = changePassword;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}