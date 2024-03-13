
import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{}

class SignInButtonPressed extends SigninEvent{
  final String email;
  final String password;

  SignInButtonPressed({
    required this.email,
    required this.password
});
  @override
  List<Object> get props =>[email,password];
}