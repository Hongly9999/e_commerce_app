import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/moduls/admin/category/view/category_form_view.dart';
import 'package:e_commerce_app/moduls/admin/category/view/category_view.dart';
import 'package:e_commerce_app/moduls/admin/category/view_model/category_form_view_model.dart';
import 'package:e_commerce_app/moduls/home/view/home_view.dart';
import 'package:e_commerce_app/moduls/login/view/login_view.dart';
import 'package:e_commerce_app/moduls/register/view/register_view.dart';
import 'package:e_commerce_app/moduls/splash/view/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/',
          page: () => HomeView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/admin/categories',
          page: () => CategoryView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/admin/categories/form',
          page: () => CategoryFormView(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
