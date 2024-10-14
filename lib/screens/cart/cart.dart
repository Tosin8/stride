import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Shopping Cart, ', 
               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
             
            ),
            SizedBox(
              height: 5,
            ),
            // Obx(()=>Column(
            //   children: userController.userModel.value.cart
            //       .map((cartItem) => CartItemWidget(cartItem: cartItem,))
            //       .toList(),
            // )),
          ],
        ),
        // Positioned(
        //     bottom: 30,
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       padding: const EdgeInsets.all(8),
        //       child: Obx(() => CustomButton(
        //           text: "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})", onTap: () {
        //             paymentsController.createPaymentMethod();
        //           }),)
        //     ))
      ],
    );
  }
}
