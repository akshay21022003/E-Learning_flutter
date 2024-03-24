import 'package:flutter/material.dart';

Widget customButton({String? name,VoidCallback? onPressed,BuildContext? context}) {
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
            // shadows: [
            //   BoxShadow(
            //     color: Theme.of(context!).colorScheme.primary,
            //     blurRadius: 10,
            //     offset: Offset(2, 2),
            //     spreadRadius: 0,
            //   )
            // ],
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
