import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesapp/models/order_model.dart';

class Information extends StatelessWidget {
  Information(this.firstName, this.lastName);

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('My Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'JostSB',
              )),
          Text('M. ${this.firstName} ${this.lastName}',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'JostSB',
              )),
        ],
      ),
      padding: const EdgeInsets.all(15));
  }
}
