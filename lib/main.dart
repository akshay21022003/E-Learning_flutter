import 'package:e_learning/bloc/course/course_bloc.dart';
import 'package:e_learning/bloc/signin/signin_bloc.dart';
import 'package:e_learning/bloc/signup/signup_bloc.dart';
import 'package:e_learning/repository/Auth/Auth_repository.dart';
import 'package:e_learning/repository/course/course_repository.dart';
import 'package:e_learning/ui/bottomnavigation/bottom_navigation_bar.dart';
import 'package:e_learning/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=> SignupBloc(AuthRepository())),
          BlocProvider(create: (_)=> SigninBloc(AuthRepository())),
          BlocProvider(create: (_)=> CourseBloc(CourseRepository()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: darkTheme,
            home: FloatingBottomNavigation()
        )
    );
  }
}
