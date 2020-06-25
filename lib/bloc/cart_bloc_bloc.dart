import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  @override
  CartBlocState get initialState => InitialCartBlocState();

  @override
  Stream<CartBlocState> mapEventToState(
    CartBlocEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
