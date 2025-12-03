import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  String? title;
SubtitleWidget({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(
            vertical: 10
        ),
        width:double.infinity ,
        child:  Text(
          textAlign: TextAlign.center,
          "$title",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        )
    );
  }
}
