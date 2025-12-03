import 'package:e_commerce_app/moduls/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  var homeViewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: Colors.blue,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView(
              children: [
                Container(height: 150),
                ListTile(
                  onTap: (){
                    Get.toNamed("/admin/categories");
                  },
                  trailing: Icon(Icons.navigate_next, color: Colors.white),
                  leading: Icon(Icons.category, color: Colors.white),
                  title: Text(
                    "List Categories",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text("Home", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepOrange,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Get.toNamed("/login");
          },
          child: Icon(Icons.login, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Username:${homeViewModel.user.value.username}",
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Text("Email: ${homeViewModel.user.value.email}"),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Phone Number: ${homeViewModel.user.value.phoneNumber}",
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: Text("Logout")),
              ],
            ),
          ),
        ),
      );
    });
  }
}
