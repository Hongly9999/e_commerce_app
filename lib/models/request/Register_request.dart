class RegisterRequest {
  RegisterRequest({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.profile,
    this.role,
    this.gender,
  });

  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  String? profile;
  String? role;
  String?gender;



  RegisterRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    profile = json['profile'];
    role = json['role'];

    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['profile'] = profile;
    map['role'] = role;
    map['gender'] = gender;
    return map;
  }
}
