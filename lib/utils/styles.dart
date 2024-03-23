import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

const Color primaryColor = Color(0xFF1F41BB);

ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.light(
            background: Colors.grey.shade300,
            primary: Colors.grey.shade500,
            secondary: Colors.grey.shade100,
            tertiary: Colors.white,
            inversePrimary: Colors.grey.shade900,
      ),
);

ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme.dark(
            background: const Color.fromARGB(255, 20, 20, 30),
            primary:const  Color.fromARGB(255, 122, 122, 122),
            secondary: const Color.fromARGB(255, 30, 30, 30),
            tertiary: const Color.fromARGB(255, 20, 20, 30),
            inversePrimary: Colors.grey.shade300
      ),
);