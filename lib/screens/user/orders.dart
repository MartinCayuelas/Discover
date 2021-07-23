import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesapp/models/order_model.dart';

class Orders extends StatelessWidget {
  Orders(this.orders);

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(children: <Widget>[
        Align(
          child: Text(
            'My Orders',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'JostSB',
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
        SizedBox(
          height: 300,
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(this.orders.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                    height: 50,
                    width: 50,
                    color: Theme.of(context).primaryColor,
                    child: _buildOrder(this.orders[index])),
              );
            }),
          ),
        ),
      ]),
      padding: const EdgeInsets.all(15),
    );
  }


  Widget _buildOrder(Order order) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  order.ref,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'JostSB',
                  ),
                ),
              )),
          Center(
            child: Image.asset(
              'images/shopping-bag.png',
              height: 50,
              width: 50,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${order.amount.toString()} €",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'JostSB',
                  ),
                ),
              )),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: order.delivered ? Colors.black : Color(0xfffc4572),
              spreadRadius: 1),
        ],
      ),
    );
  }
}
