import 'package:e_learning/bloc/signup/signup_bloc.dart';
import 'package:e_learning/bloc/signup/signup_event.dart';
import 'package:e_learning/bloc/signup/signup_state.dart';
import 'package:e_learning/ui/signin/signin_screen.dart';
import 'package:e_learning/utils/button.dart';
import 'package:e_learning/utils/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreen({super.key});

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
                    customTextBox(
                      name: 'Username',
                      controller: _usernameController
                    ),
                    customTextBox(
                      name: 'Email',
                      controller: _emailController
                    ),
                    customTextBox(
                      name: 'Password',
                      controller: _passwordController
                    ),
                    customTextBox(
                        name: 'Confirm-Password'
                    ),
                    BlocConsumer<SignupBloc,SignupStates>(
                      listener: (context, state) {
                        print(state.signupStatus);
                        if (state.signupStatus == SignupStatus.success) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
                        } else if (state.signupStatus == SignupStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              duration: Duration(seconds: 3), // Adjust the duration as needed
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );

                        }
                      },
                      builder:(context,state){
                        return customButton(
                            name: 'Sign up',
                            onPressed: (){
                              _onSignUpPressed(context);
                            }
                        );
                      },
                    ),
                    _alreadyHaveAnAccount()
                  ],
                ),
                _lowerSection()
              ],
            ),
          )),
    );
  }

  void _onSignUpPressed(BuildContext context) {
    context.read<SignupBloc>().add(SignUpButtonPressed(
      username: _usernameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    ));
  }
}

Widget _upperSection(){
  return const Column(
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create Account',
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
      const Text(
        'Create an account so you can explore all the existing jobs',
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
Widget _lowerSection(){
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
                offset: Offset(0, 2), // This determines the offset of the shadow from the box
              ),
            ],

            image:const  DecorationImage(
                image: AssetImage('assets/google.png'), scale: 2)),
      )
    ],
  );
}

Widget _alreadyHaveAnAccount({VoidCallback? onPressed}){
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 357,
      height: 41,
      padding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Already have an account ?',
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