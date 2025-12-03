// import 'package:e_commerce_app/moduls/admin/category/view_model/category_form_view_model.dart';
// import 'package:e_commerce_app/widgets/button_custom_widget.dart';
// import 'package:e_commerce_app/widgets/input_custom_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get.dart';
// class CategoryFormView extends StatelessWidget {
//   const CategoryFormView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var viewModel = Get.put(CategoryFormViewModel());
//     return Obx((){
//       return  Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           iconTheme: IconThemeData(
//               color: Colors.white
//           ),
//           title: Text("Create Category",style: TextStyle(color: Colors.white),),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               InputCustomWidget(
//                 controller: viewModel.categoryNameController.value;
//                 labelText: "Category name",
//                 hintText: "Enter category name",
//               ),
//               ButtonCustomWidget(
//                 onPressed: (){
//                   if(viewModel.createLoading.value == false){
//                     viewModel.onCreateCategory();
//                   }
//                 },
//                 onLoading: viewModel.createLoading.value,
//                 title: "Create",
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
//


import 'package:e_commerce_app/moduls/admin/category/view_model/category_form_view_model.dart';
import 'package:e_commerce_app/widgets/button_custom_widget.dart';
import 'package:e_commerce_app/widgets/input_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryFormView extends StatelessWidget {
  const CategoryFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(CategoryFormViewModel());

    return Obx(() {
      final isCreate = (viewModel.categoryRequest.value.id == null ||
          viewModel.categoryRequest.value.id == 0);

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            isCreate ? "Create Category" : "Update Category",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputCustomWidget(
                controller: viewModel.categoryNameController.value,
                labelText: isCreate
                    ? "Create Category Name"
                    : "Update Category Name",
                hintText: "Enter category name",
              ),

              const SizedBox(height: 20),

              ButtonCustomWidget(
                onPressed: () {
                  if (!viewModel.createLoading.value) {
                    viewModel.onCreateCategory();
                  }
                },
                onLoading: viewModel.createLoading.value,
                title: isCreate ? "Create" : "Update",
              ),
            ],
          ),
        ),
      );
    });
  }
}
