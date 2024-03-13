import 'package:flutter/material.dart';
Widget customTextBox({String? name,TextEditingController? controller}){
  return Column(
    children: [
      Container(
        width: 357,
        height: 64,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFF1F4FF),
          border: Border.all(width: 2, color: Color(0xFF1F41BB)
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: name,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Color(0xFF494949),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),// Remove default border
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}