// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:stride/controllers/cart_controller.dart';

// import 'package:stride/model/cart_item.dart';

// class CartItemWidget extends StatelessWidget {
//   final CartItemModel cartItem;

//   const CartItemWidget({
//     Key? key,
//     required this.cartItem,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final CartController cartController = Get.find(); // Get the CartController

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.network(
//             cartItem.image,
//             width: 80,
//           ),
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 14),
//                 child: Text(cartItem.name),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.chevron_left),
//                     onPressed: () {
//                       cartController.decreaseQuantity(cartItem);
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cartItem.quantity.toString(),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.chevron_right),
//                     onPressed: () {
//                       cartController.increaseQuantity(cartItem);
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(14),
//           child: Text(
//             '\$${cartItem.cost}',
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
