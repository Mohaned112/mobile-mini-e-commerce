// import 'package:ecommerce_finalproject/model/product_model.dart';
// import 'package:equatable/equatable.dart';
//
// class Cart extends Equatable {
//   final List<Product> products;
//
//   const Cart({this.products = const <Product>[]});
//
//   Map productQuantity(products) {
//     var quantity = Map();
//
//     products.forEach((products) {
//       if (!quantity.containsKey(products)) {
//         quantity[products] = 1;
//       } else {
//         quantity[products] += 1;
//       }
//     });
//     return quantity;
//   }
//
//
//
//
//
//   @override
//   List<Object?> get props => [products];
//
//
//   double get subtotal =>
//       products.fold(0, (total, current) => total + current.price);
//
//   double deliveryFree(subtotal) {
//     if (subtotal >= 30.0) {
//       return 0.0;
//     } else
//       return 10.0;
//   }
//
//   double total(subtotal, deliveryFree) {
//     return subtotal + deliveryFree(subtotal);
//   }
//
//   String freeDelivery(subtotal) {
//     if (subtotal >= 30.0) {
//       return 'You Have Free Delivery';
//     } else {
//       double missing = 30.0 - subtotal;
//       return 'Add \$${missing.toStringAsFixed(2)}for Free Delivery';
//     }
//   }
//
//   String get totalString => total(subtotal, deliveryFree).toStringAsFixed(2);
//
//   String get subtotalString => subtotal.toStringAsFixed(2);
//
//   String get deliveryFreeString => deliveryFree(subtotal).toStringAsFixed(2);
//
//   String get freeDeliveryString => freeDelivery(subtotal);
//
//
// }
