import 'package:bloc/bloc.dart';
import 'package:e_learning/bloc/signin/signin_event.dart';
import 'package:e_learning/bloc/signin/signin_state.dart';
import 'package:e_learning/repository/Auth/Auth_repository.dart';

class SigninBloc extends Bloc<SigninEvent,SigninState>{
  AuthRepository authRepository = AuthRepository();
  SigninBloc(this.authRepository):super(const SigninState()){
    on<SignInButtonPressed>(signin);
  }

  void signin(SignInButtonPressed event,Emitter<SigninState> emit)async{
    emit(state.copyWith(signinStatus: SigninStatus.loading));
    final response = await authRepository.signinApi(email: event.email, password: event.password);
    if(!response.containsKey("message")){
      emit(state.copyWith(signinStatus: SigninStatus.success));
    }else{
      emit(state.copyWith(signinStatus: SigninStatus.failure,message: response["message"]));
      emit(state.copyWith(signinStatus: SigninStatus.initail));
    }
  }


}