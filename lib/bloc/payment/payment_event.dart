import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable{}

class PaymentInitiated extends PaymentEvent{
  final double amount;
  PaymentInitiated({required this.amount});

  @override
  List<Object> get props => [amount];
}