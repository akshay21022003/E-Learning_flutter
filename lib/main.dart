import 'package:e_learning/bloc/signup/signup_bloc.dart';
import 'package:e_learning/repository/signup_repository.dart';
import 'package:e_learning/ui/signup/signup_screen.dart';
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
          BlocProvider(create: (_)=> SignupBloc(SignupRepository()))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeMode.dark,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: SignUpScreen()
        )
    );
  }
}
