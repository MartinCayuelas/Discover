import 'package:flutter/material.dart';
import 'package:shoesapp/models/shoes_model.dart';
import 'package:shoesapp/models/ListShoes.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Shoes> shoes = [];
  int nbItems = 0;
  double totalCart = 0.00;

  void init() {
    shoes = ListShoes().listShoesPuma;
    nbItems = shoes.length;
    totalCart = calculateTotal(shoes);
  }

  double calculateTotal(List<Shoes> shoes) {
    return shoes.fold(0, (t, e) => t + e.price);
  }

  @override
  Widget build(BuildContext context) {
    init();
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
          _buildListBody(),
          Divider(
            height: 1,
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          _buildBottomBody(),
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
              'My Bag',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'JostSB',
              ),
            ),
            Text(
              'Total $nbItems items',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'JostSB',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListBody() {
    return SizedBox(
      height: 530,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: shoes.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(1, 0, 1, 10),
            child: Container(
                height: 150,
                width: 400,
                color: Theme.of(context).primaryColor,
                child: _buildRowBody(shoes[index])),
          );
        },
      ),
    );
  }

  Widget _buildRowBody(Shoes shoe) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 25,
          right: 270,
          left: 10,
          bottom: 5,
          child: Card(
            color: Color(0xFFdfe3ea),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: -220,
          child: Image.asset(
            'images/${shoe.brandName.toLowerCase()}/${shoe.imageName}.png',
            height: 140,
            width: 140,
          ),
        ),
        Positioned(
          top: 25,
          right: 0,
          left: 185,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                shoe.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JostR',
                ),
              ),
              Text(
                '${shoe.price} €',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'JostSB',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  children: <Widget>[
                    Material(
                      color: Color(0xFFF5F5F5),
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 30,
                          child: SizedBox(
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('1'),
                    ),
                    Material(
                      color: Color(0xFFF5F5F5),
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 30,
                          child: SizedBox(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBody() {
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'JostR',
                  ),
                ),
                Text(
                  '$totalCart €',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'JostSB',
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 345.0,
          height: 45.0,
          child: new RaisedButton(
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Theme.of(context).accentColor)),
            child: new Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
