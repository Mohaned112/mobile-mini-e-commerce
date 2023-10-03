part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;

  WishlistLoaded({this.wishlist = const Wishlist()});

  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {}
