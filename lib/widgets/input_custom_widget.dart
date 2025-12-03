import 'package:flutter/material.dart';
class InputCustomWidget extends StatelessWidget {
  String? labelText,hintText;
  ValueChanged<String>? onChanged;
  TextEditingController? controller;
  bool? obscureText;
  Icon? prefixIcon,suffixIcon;
 InputCustomWidget({super.key, this.labelText,
   this.hintText,this.onChanged,this.controller,
   this.obscureText = false,
   this.prefixIcon,
   this.suffixIcon
 });

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText??false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          // suffixIcon: Icon(Icons.remove_red_eye),
          suffixIcon: suffixIcon,
          // child:Icon(Icons.remove_red_eye)),
          labelText: labelText??"",
          labelStyle: TextStyle(color: Colors.black),
          hintText: hintText??"",
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
    );
  }
}
