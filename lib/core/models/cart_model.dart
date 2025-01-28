import 'package:bookly/core/models/best_seller_assets.dart';

class CartModel {
  static List<BestSellerAssets> cartItems = [];

  static void addToCart(BestSellerAssets book) {
    cartItems.add(book);
  }

  static List<BestSellerAssets> getCartItems() {
    return cartItems;
  }

  static void submitOrder() {}

  static void removeFromCart(int index) {}
}
