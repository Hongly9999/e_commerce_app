import 'package:e_commerce_app/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}
