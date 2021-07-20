import 'package:flutter/material.dart';
import 'package:shoesapp/models/ListOrders.dart';
import 'package:shoesapp/models/User.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User user;

  @override
  void initState() {
    super.initState();

    user = new User(
        listOrders: listOrders,
        firstName: "Martin",
        lastName: "Cayuelas",
        id: 121);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          _buildTopBody(),
          Divider(
            height: 1,
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          child: Image.asset(
            'images/backArrowBlack.png',
            width: 25,
            height: 15,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildTopBody() {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'My Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'JostSB',
                  ),
                ),
              ])),
    );
  }
}
