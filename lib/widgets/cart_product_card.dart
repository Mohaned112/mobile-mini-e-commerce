// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/cart/cart_bloc.dart';
// import '../model/product_model.dart';
//
// class CartProductCard extends StatefulWidget {
//   final Product product;
//   final int quantity;
//
//
//   const CartProductCard({super.key, required this.product, required this.quantity});
//
//   @override
//   State<CartProductCard> createState() => _CartProductCardState();
// }
//
// class _CartProductCardState extends State<CartProductCard> {
//   int quantity = 1;
//   @override
//   Widget build(BuildContext context) {
//     num priceQuantity = widget.product.price * quantity;
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//           Image.network(
//             widget.product.imageUrl,
//             width: 100,
//             height: 100,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.product.name,
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyLarge!
//                       .copyWith(color: Colors.black),
//                 ),
//                 Text(
//                   '\$$priceQuantity',
//                   style: Theme.of(context)
//                       .textTheme
//                       .displaySmall!
//                       .copyWith(color: Colors.black),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           BlocBuilder<CartCubit, CartState>(
//             builder: (context, state) {
//               return Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         if(quantity == 1){
//                           quantity = 1;
//                         }else{
//                           quantity--;
//                         }
//                       });
//                       context.read<CartCubit>().addCartProductRemoved(widget.product,state);
//                     },
//                     icon: Icon(Icons.remove_circle),
//                   ),
//                   Text(
//                     '$quantity',
//                     style: Theme.of(context)
//                         .textTheme
//                         .displayMedium!
//                         .copyWith(color: Colors.black),
//                   ),
//                   Text('${widget.quantity}',style: Theme.of(context).textTheme.displayMedium,),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         quantity++;
//                       });
//                       context.read<CartCubit>().addCartProductAdded(widget.product,state);
//                     },
//                     icon: Icon(Icons.add_circle),
//                   ),
//                 ],
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
