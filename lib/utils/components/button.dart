import 'package:flutter/material.dart';

Widget customButton({String? name,VoidCallback? onPressed}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 357,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: ShapeDecoration(
            color: Color(0xFF1F41BB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0xFFCAD6FF),
                blurRadius: 20,
                offset: Offset(0, 10),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
