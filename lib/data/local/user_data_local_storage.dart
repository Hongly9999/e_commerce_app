import 'package:e_commerce_app/models/response/User.dart';
import 'package:get_storage/get_storage.dart';

class UserDataLocalStorage {
  static String username = "username";
  static String email = "email";
  static String phone = "phone";
  static String accessToken = "accessToken";
  static String refreshToken = "refreshToken";

  static saveUserInformation({User? user, String? token, String? refresh}) {
    var storage = GetStorage();
    storage.write(username, user?.username ?? "");
    storage.write(email, user?.email ?? "");
    storage.write(phone, user?.phoneNumber ?? "");
    storage.write(accessToken, token ?? "");
    storage.write(refreshToken, refresh ?? "");
  }

  static User getUserInformation() {
    var storage = GetStorage();
    return User(
      username: storage.read(username),
      email: storage.read(email),
      phoneNumber: storage.read(phone),
    );
  }

  static String getAccessToken(){
    var storage = GetStorage();
    return storage.read(accessToken) ?? "";

  }

  static String getRefreshToken(){
    var storage = GetStorage();
    return storage.read(refreshToken) ?? "";

  }

  //Remove information user
  static removeUserInformation() {
    var storage = GetStorage();
    storage.remove(username);
    storage.remove(email);
    storage.remove(phone);
    storage.remove(accessToken);
    storage.remove(refreshToken);
  }

  static removeAccessToken(){
    var storage = GetStorage();
    return storage.remove(accessToken);

  }

  static removeRefreshToken(){
    var storage = GetStorage();
    storage.remove(refreshToken);

  }

}
