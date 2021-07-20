import 'package:shoesapp/models/shoes_model.dart';

class Cart {
  final List<Shoes> listShoes;

  const Cart({this.listShoes});

  void addItemInCart(Shoes s) {
    this.listShoes.add(s);
  }

  void removeItemFromCart(Shoes s) {
    this.listShoes.remove(s);
  }

  double calculateTotal() {
    return this.listShoes.fold(0, (t, e) => t + e.price);
  }

  int getNumberOfItems() {
    return this.listShoes.length;
  }
}
