import 'package:bloc/bloc.dart';
import 'package:ecommerce_finalproject/model/models.dart';
import 'package:ecommerce_finalproject/model/wish_list_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistLoading());
  List<Product> product = [];

  void startWishlist() {
    emit(WishlistLoading());
    try {
      // Simulate some asynchronous operation
      Future.delayed(Duration(seconds: 1), () {
        emit(WishlistLoaded());
      });
    } catch (_) {}
  }

  void addWishlistProduct(Product products) {
    if (state is WishlistLoaded) {
      try {
        product.add(products);
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(product),
          ),
        ));
      } catch (_) {}
    }
  }

  void removeWishlistProduct(WishlistState state) {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products),
          ),
        ));
      } catch (_) {}
    }
  }
}
