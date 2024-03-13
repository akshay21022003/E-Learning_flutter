import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends SignupEvent {
  final String username;
  final String email;
  final String password;

  SignUpButtonPressed({required this.username, required this.email, required this.password});
  @override
  List<Object> get props => [username,email,password];
}