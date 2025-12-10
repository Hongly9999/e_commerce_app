import 'package:e_commerce_app/moduls/admin/category/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(CategoryViewModel());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "List Categories",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {
          Get.toNamed("/admin/categories/form");
        }, icon: Icon(Icons.add))],
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async{
            viewModel.getAllCategories();
          },
          child: SizedBox(
            width: double.infinity,
            child: viewModel.isLoading == true
                ? Center(child: CircularProgressIndicator(color: Colors.blue))
                : ListView.builder(
                    itemCount: viewModel.categoryList.length,
                    itemBuilder: (context, index) {
                      var data = viewModel.categoryList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black12.withBlue(10),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("${data.id}."),
                                Text("${data.name}"),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    viewModel.getCategoryById(data.id ?? 0);
                                  },
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // viewModel.confirmDelete(data.id ?? 0);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        );
      }),
    );
  }
}
