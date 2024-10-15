import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlistItems = <Map<String, dynamic>>[].obs;
  var favoriteProductIds = <String>[].obs; // Store the IDs of favorite products

  void toggleFavoriteStatus(Map<String, dynamic> product) {
    if (favoriteProductIds.contains(product['id'])) {
      favoriteProductIds.remove(product['id']);
      removeProductFromWishlist(product);
    } else {
      favoriteProductIds.add(product['id']);
      addProductToWishlist(product);
    }
  }

  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  void addProductToWishlist(Map<String, dynamic> product) {
    if (!wishlistItems.any((item) => item['id'] == product['id'])) {
      wishlistItems.add(product);
      Get.snackbar(
        'Added to Wishlist',
        '${product['name']} has been added to your wishlist.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeProductFromWishlist(Map<String, dynamic> product) {
    wishlistItems.removeWhere((item) => item['id'] == product['id']);
    Get.snackbar(
      'Removed from Wishlist',
      '${product['name']} has been removed from your wishlist.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
