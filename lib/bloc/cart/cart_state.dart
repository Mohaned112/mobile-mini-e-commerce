part of 'cart_bloc.dart';

abstract class CartState extends Equatable{
  const CartState();

  @override
  List<Object> get props  => [];
}



class CartLoading extends CartState {
  @override
  List<Object> get props  => [];
}

class CartLoaded extends CartState {
 final List<Product> cart;

  const CartLoaded({required this.cart});

  @override
  List<Object> get props  => [];

}

class CartLoadError extends CartState {
  @override
  List<Object> get props  => [];
}

