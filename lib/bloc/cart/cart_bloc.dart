
import 'package:bloc/bloc.dart';
import 'package:ecommerce_finalproject/model/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoaded(cart: []));
  List<Product> updatedCart = [];

  void addCartProductAdded(Product product, CartState state) {
    if (state is CartLoaded) {
      try {
        updatedCart.add(product);
        emit(CartLoaded(cart: updatedCart));
      } catch (_) {}
    }
  }

  void addCartProductRemoved(Product product, CartState state) {
    if (state is CartLoaded) {
      try {
        updatedCart.remove(product);

        emit(CartLoaded(cart: updatedCart));
      } catch (_) {}
    }
  }
}
