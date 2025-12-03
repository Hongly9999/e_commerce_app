import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final bool onLoading;

  const ButtonCustomWidget({
    super.key,
    this.onPressed,
    this.title,
    this.onLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: onLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5,
          ),
        )
            : Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ButtonCustomWidget extends StatelessWidget {
//   VoidCallback? onPressed;
//   String? title;
//   bool? onLoading;
//   ButtonCustomWidget({
//     super.key,
//     this.onPressed,
//     this.title,
//     this.onLoading = false,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.blue ,
//         borderRadius: BorderRadius.all(Radius.circular(10))
//       ),
//       color: Colors.blue,
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: onLoading == true
//             ? Center(child: CircularProgressIndicator(color: Colors.white))
//             : SizedBox(
//                 width: double.infinity,
//                 child: Text(
//                   textAlign: TextAlign.center,
//                   title ?? "",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(vertical: 20),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//       ),
//     );
//   }
// }
