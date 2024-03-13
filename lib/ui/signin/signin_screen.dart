import 'package:e_learning/bloc/signin/signin_bloc.dart';
import 'package:e_learning/bloc/signin/signin_event.dart';
import 'package:e_learning/bloc/signin/signin_state.dart';
import 'package:e_learning/ui/homepage/home_screen.dart';
import 'package:e_learning/ui/signup/signup_screen.dart';
import 'package:e_learning/utils/button.dart';
import 'package:e_learning/utils/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _upperSection(),
            Column(
              children: [
                customTextBox(name: 'Email', controller: _emailController),
                customTextBox(
                    name: 'Password', controller: _passwordController),
                _forgetPassword(),
                BlocConsumer<SigninBloc, SigninState>(
                    listener: (context, state) {
                  if (state.signinStatus == SigninStatus.success) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                  if (state.signinStatus == SigninStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        duration: Duration(
                            seconds: 3), // Adjust the duration as needed
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  }
                }, builder: (context, state) {
                  return customButton(
                      name: 'Sign in',
                      onPressed: () {
                        context.read<SigninBloc>().add(SignInButtonPressed(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()));
                      });
                }),
                _createNewAccount(onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                })
              ],
            ),
            _lowerSection()
          ],
        ),
      )),
    );
  }
}

Widget _upperSection() {
  return const Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1F41BB),
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              height: 0,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Welcome back you’ve\nbeen missed!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          height: 0,
        ),
      ),
    ],
  );
}

Widget _lowerSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Or continue with',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF1F41BB),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 35,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0,
                    2), // This determines the offset of the shadow from the box
              ),
            ],
            image: const DecorationImage(
                image: AssetImage('assets/google.png'), scale: 2)),
      )
    ],
  );
}

Widget _forgetPassword() {
  return const Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot your password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1F41BB),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget _createNewAccount({VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 357,
      height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Create new account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF494949),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    ),
  );
}
