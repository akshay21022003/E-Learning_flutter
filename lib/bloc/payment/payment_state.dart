import 'package:equatable/equatable.dart';

enum PaymentStatus{initial,success,failure}
class PaymentState extends Equatable{
  final PaymentStatus paymentStatus;

  const PaymentState({
   this.paymentStatus = PaymentStatus.initial
});

  PaymentState copyWith({PaymentStatus? paymentStatus}){
    return PaymentState(
      paymentStatus: paymentStatus ?? this.paymentStatus
    );
  }

  @override
  List<Object> get props =>[paymentStatus];
}