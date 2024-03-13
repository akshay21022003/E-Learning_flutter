import 'package:equatable/equatable.dart';

enum SigninStatus { initail, loading, success, failure }

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final String message;

  const SigninState({
    this.signinStatus = SigninStatus.initail,
        this.message = ""
  });

  SigninState copyWith({SigninStatus? signinStatus,String? message}){
    return SigninState(
      message: message ?? this.message,
      signinStatus: signinStatus ?? this.signinStatus,
    );
  }
  @override
  List<Object> get props =>[signinStatus,message];

}
