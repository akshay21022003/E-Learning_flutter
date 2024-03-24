import 'package:flutter/material.dart';
Widget customTextBox({String? name,TextEditingController? controller,BuildContext? context}){
  return Column(
    children: [
      Container(
        width: 357,
        height: 64,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context!).colorScheme.secondary,
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
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
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