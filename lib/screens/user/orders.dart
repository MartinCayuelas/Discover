import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesapp/models/order_model.dart';

class Orders extends StatefulWidget {
  Orders(this.orders);

  final List<Order> orders;

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final List<String> options = ["All", "Delivered", "Not Delivered"];
  String _selectedFilter = 'All';
  List<Order> ordersToDisplay ;

  void initState() {
    super.initState();
    ordersToDisplay = this.widget.orders;
  }

  void _changeFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      _changeOrders(filter);
    });
  }

  void _changeOrders(String option) {
    switch (option) {
      case "All":
        _setOrders(this.widget.orders);
        break;
      case "Delivered":
        _setOrders(
            this.widget.orders.where((element) => element.delivered).toList());
        break;
      case "Not Delivered":
        _setOrders(
            this.widget.orders.where((element) => !element.delivered).toList());
        break;
    }
    ;
  }

  void _setOrders(List<Order> orders) {
    setState(() {
      ordersToDisplay = orders;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(children: <Widget>[
        Align(
          child: Text(
            'My Orders (${ordersToDisplay.length})',
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
          height: 350,
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(ordersToDisplay.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                    height: 50,
                    width: 50,
                    color: Theme.of(context).primaryColor,
                    child: _buildOrder(ordersToDisplay[index])),
              );
            }),
          ),
        ),
        _buildFilters(),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,),
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

  Widget _buildFilters() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 70,
              width: 110,
              child: Card(
                color: _selectedFilter == options[index]
                    ? Colors.black87
                    : Colors.white,
                child: TextButton(
                  child: Text(
                    options[index],
                    style: TextStyle(
                        color: _selectedFilter == options[index]
                            ? Colors.white
                            : Colors.black87),
                  ),
                  onPressed: () {
                    _changeFilter(options[index]);
                  },
                ),
              ),
            );
          }),
    );
  }
}
