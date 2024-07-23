import 'package:flutter/material.dart';

//home page related common widgets

Widget customBoxTemplate(var data, bool toggle) {
  //String labletext, String imageicon, Color bgcolor) {
  return Container(
    height: toggle ? 100 : 0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: data["color"]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        toggle
            ? SizedBox(height: 60, child: Image.asset(data["image"]))
            : const SizedBox(),
        Text(data["lable"]),
      ],
    ),
  );
}
