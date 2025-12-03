import 'package:e_commerce_app/moduls/login/view_model/login_view_model.dart';
import 'package:e_commerce_app/widgets/header_title_widget.dart';
import 'package:e_commerce_app/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  var loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Obx((){
       return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderTitleWidget(title: "Login"),
              SubtitleWidget(title: "to E-Commerce App"),
              SizedBox(height: 35),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  onChanged: (value){
                    loginViewModel.onChangeValueUsername(value);
                  },
                  controller: loginViewModel.usernameController.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter your username",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  onChanged: (value){
                    loginViewModel.onChangeValuePassword(value);
                  },
                  controller: loginViewModel.passwordController.value,
                  obscureText: loginViewModel.enablePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    // suffixIcon: Icon(Icons.remove_red_eye),
                    suffixIcon: InkWell(
                        onTap: (){
                          var value = loginViewModel.enablePassword.value;
                          loginViewModel.onEnablePassword(!value);
                        },
                        child:Icon(Icons.remove_red_eye),
                    ),
                        // child:Icon(Icons.remove_red_eye)),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if(loginViewModel.loadingLogin == false){
                      loginViewModel.onLogin();
                    }
                  },
                  child:
                    loginViewModel.loadingLogin.value == true ?
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                 : SizedBox(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  Get.toNamed("/register");
                },
                child: Text("Register", style: TextStyle(color: Colors.black)),
              ),

              // SubtitleWidget(
              //   title: "${loginViewModel.username.value}",
              // )
            ],
          ),
        );
      })

    );
  }
}
