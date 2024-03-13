import 'package:bloc/bloc.dart';
import 'package:e_learning/bloc/signup/signup_event.dart';
import 'package:e_learning/bloc/signup/signup_state.dart';
import 'package:e_learning/repository/Auth/Auth_repository.dart';

class SignupBloc extends Bloc<SignupEvent, SignupStates> {
  AuthRepository signupRepository = AuthRepository();

  SignupBloc(this.signupRepository) : super(const SignupStates()) {
    on<SignUpButtonPressed>(signup);
  }

  void signup(SignUpButtonPressed event, Emitter<SignupStates> emit) async {
    emit(state.copyWith(signupStatus: SignupStatus.loading));
    final response = await signupRepository.signupApi(email: event.email, password: event.password,username: event.username);
    if(response.containsKey("errorMessage")){
      emit(state.copyWith(signupStatus: SignupStatus.failure,message:response['errorMessage'] ));
      emit(state.copyWith(signupStatus: SignupStatus.initial));
    }else{
      emit(state.copyWith(signupStatus: SignupStatus.success));
    }
  }
}
