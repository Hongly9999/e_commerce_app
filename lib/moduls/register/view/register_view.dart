
import 'package:e_commerce_app/moduls/register/view_model/register_view_model.dart';
import 'package:e_commerce_app/widgets/button_custom_widget.dart';
import 'package:e_commerce_app/widgets/input_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel = Get.put(RegisterViewModel());

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InputCustomWidget(
                controller: registerViewModel.firstName.value,
                labelText: "First name",
                hintText: "First name",
              ),

              InputCustomWidget(
                controller: registerViewModel.lastName.value,
                labelText: "Last name",
                hintText: "Last name",
              ),

              InputCustomWidget(
                controller: registerViewModel.username.value,
                labelText: "Username",
                hintText: "Username",
              ),

              InputCustomWidget(
                controller: registerViewModel.phoneNumber.value,
                labelText: "Phone",
                hintText: "Phone",
              ),

              InputCustomWidget(
                controller: registerViewModel.email.value,
                labelText: "Email",
                hintText: "Email",
              ),

              InputCustomWidget(
                controller: registerViewModel.password.value,
                obscureText: true,
                labelText: "Password",
                hintText: "Password",
              ),

              InputCustomWidget(
                controller: registerViewModel.confirmPassword.value,
                obscureText: true,
                labelText: "Confirm Password",
                hintText: "Confirm Password",
              ),

              const SizedBox(height: 10),

              // Gender Selection
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      registerViewModel.gender.value = true;
                    },
                    child: Row(
                      children: [
                        registerViewModel.gender.value == true
                            ? const Icon(Icons.check_box, color: Colors.blue)
                            : const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 10),
                        const Text("Male"),
                      ],
                    ),
                  ),

                  const SizedBox(width: 30),

                  GestureDetector(
                    onTap: () {
                      registerViewModel.gender.value = false;
                    },
                    child: Row(
                      children: [
                        registerViewModel.gender.value == false
                            ? const Icon(Icons.check_box, color: Colors.blue)
                            : const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 10),
                        const Text("Female"),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Register Button
              ButtonCustomWidget(
                title: "Register",
                onLoading: registerViewModel.loading.value,
                onPressed: registerViewModel.onRegister,
              ),
            ],
          ),
        ),
      );
    });
  }
}

