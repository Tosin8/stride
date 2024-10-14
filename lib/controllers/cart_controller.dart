import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stride/auth/repository/user_repo.dart';
import 'package:stride/model/cart_item.dart';
import 'package:stride/model/products/product_model.dart';
import 'package:stride/model/user_model.dart';
import 'package:uuid/uuid.dart';
 // Use the UserRepository

class CartController extends GetxController {
  static CartController get instance => Get.find();
  RxDouble totalCartPrice = 0.0.obs;
  final UserRepository userController = Get.find(); // Get the user controller

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        String itemId = const Uuid().v4();
        final cartItem = CartItemModel(
          id: itemId,
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
          image: product.image,
          cost: product.price,
        );
        userController.updateSingleField({
          "cart": FieldValue.arrayUnion([cartItem.toJson()])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateSingleField({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.toString());
    }
  }

  void changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      for (var cartItem in userModel.cart) {
        totalCartPrice += cartItem.cost;
      }
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      userController.userModel.value.cart
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      item.quantity--;
      userController.updateSingleField({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    item.quantity++;
    userController.updateSingleField({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
