import 'package:shoesapp/models/order_model.dart';

class User {
  final List<Order> listOrders;
  final int id;

  final String firstName;
  final String lastName;

  const User({this.listOrders, this.firstName, this.lastName, this.id});

  int getNumberOfOrder() {
    return this.listOrders.length;
  }

  List<Order> getAllDeliveredOrders() {
    return this.listOrders.where((element) => element.delivered);
  }

  List<Order> getAllUnDeliveredOrders() {
    return this.listOrders.where((element) => !element.delivered);
  }
}
