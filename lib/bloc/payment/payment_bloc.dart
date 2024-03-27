import 'package:bloc/bloc.dart';
import 'package:e_learning/bloc/payment/payment_event.dart';
import 'package:e_learning/bloc/payment/payment_state.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  Razorpay razorpay = Razorpay();

  PaymentBloc(this.razorpay) : super(const PaymentState()) {
    on<PaymentInitiated>(handlePayment);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (data) {
      emit(state.copyWith(paymentStatus: PaymentStatus.success));
    });
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (error) {
      emit(state.copyWith(paymentStatus: PaymentStatus.failure));
      emit(state.copyWith(paymentStatus: PaymentStatus.initial));
    });
  }

  void handlePayment(PaymentInitiated event, Emitter<PaymentState> emit){
    try {
      var options = {
        'key': 'rzp_test_RiGhzdKOJwjEiM',
        'amount': event.amount * 100,
        'name': 'akshay',
        'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
      };
      razorpay.open(options);

    } catch (error) {
      print("payment error $error");
    }
  }

  @override
  Future<void> close() {
    razorpay.clear();
    return super.close();
  }
}
