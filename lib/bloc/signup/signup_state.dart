import 'package:equatable/equatable.dart';

enum SignupStatus {initial,loading,success,failure}

class SignupStates extends Equatable{
  final SignupStatus signupStatus;
  final String message;

  const SignupStates({
    this.signupStatus = SignupStatus.initial,
    this.message=""
  });

  SignupStates copyWith({SignupStatus? signupStatus,String? message}){
    return SignupStates(
      signupStatus: signupStatus ?? this.signupStatus,
      message: message ?? this.message,
    );
  }
  @override
  List<Object> get props =>[signupStatus];
}