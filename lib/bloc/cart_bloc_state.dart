import 'package:equatable/equatable.dart';

abstract class CartBlocState extends Equatable {
  const CartBlocState();
}

class InitialCartBlocState extends CartBlocState {
  @override
  List<Object> get props => [];
}
