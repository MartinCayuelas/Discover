import 'package:flutter/material.dart';
import 'package:shoesapp/customs/PainterCircle.dart';
import 'package:shoesapp/models/ListSizesShoes.dart';
import 'package:shoesapp/models/shoes_model.dart';

class DetailShoes extends StatefulWidget {
  @override
  _DetailShoesState createState() => _DetailShoesState();
}

class _DetailShoesState extends State<DetailShoes> {
  List<String> sizes = ListSizeShoes().ukSizes;

  void _changeSizes(String type) {
    setState(() {
      if (type == 'UK') {
        sizes = ListSizeShoes().ukSizes;
        _selectedSize = '8.5';
        _selectedSizes = 'UK';
      } else {
        sizes = ListSizeShoes().usaSizes;
        _selectedSize = '8.5';
        _selectedSizes = 'USA';
      }
    });
  }

  void _changeSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  String _selectedSize = '8.5';
  String _selectedSizes = 'UK';

  @override
  Widget build(BuildContext context) {
    final Shoes shoes = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: _buildAppBar(shoes),
      body: _buildBody(shoes),
    );
  }

  Widget _buildAppBar(Shoes shoes) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: shoes.color,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          child: Image.asset(
            'images/backArrow.png',
            width: 25,
            height: 15,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        shoes.brandName,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'JostSB',
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: Colors.grey.withOpacity(0.2),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBody(Shoes shoes) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CustomPaint(
                painter: CurvePainterCircle(color: shoes.color),
              ),
            ),
            Image.asset(
              'images/${shoes.brandName.toLowerCase()}/${shoes.imageName}15.png',
              height: 320,
              width: 320,
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Card(
                color: Color(0xFFf5f6fa),
                elevation: 0.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'images/${shoes.brandName.toLowerCase()}/${shoes.imageName}15.png',
                      height: 110,
                      width: 110,
                    ),
                  ),
                ),
              ),
              Card(
                color: Color(0xFFf5f6fa),
                elevation: 0.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'images/${shoes.brandName.toLowerCase()}/${shoes.imageName}.png',
                      height: 110,
                      width: 110,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 2,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    shoes.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'JostSB',
                        fontSize: 23.0),
                  ),
                  Text(
                    '${shoes.price}€',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'JostSB',
                        fontSize: 23.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                shoes.description,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'JostR',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ("More details").toUpperCase(),
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontFamily: 'JostR',
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                color: Colors.black,
                height: 3,
                thickness: 1,
                indent: 0,
                endIndent: 290,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Size',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'JostSB',
                        fontSize: 23.0),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          'UK',
                          style: _selectedSizes == 'UK'
                              ? TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'JostSB',
                                  fontSize: 20.0)
                              : TextStyle(
                                  color: Colors.grey.shade400,
                                  fontFamily: 'JostSB',
                                  fontSize: 20.0),
                        ),
                        onTap: () {
                          _changeSizes('UK');
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: Text(
                          'USA',
                          style: _selectedSizes == 'USA'
                              ? TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'JostSB',
                                  fontSize: 20.0)
                              : TextStyle(
                                  color: Colors.grey.shade400,
                                  fontFamily: 'JostSB',
                                  fontSize: 20.0),
                        ),
                        onTap: () {
                          _changeSizes('USA');
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: sizes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 70,
                        width: 95,
                        child: Card(
                          color: _selectedSize == sizes[index]
                              ? Colors.black87
                              : Colors.white,
                          child: FlatButton(
                            child: Text(
                              sizes[index],
                              style: TextStyle(
                                  color: _selectedSize == sizes[index]
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                            onPressed: () {
                              _changeSize(sizes[index]);
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 345.0,
          height: 45.0,
          child: new RaisedButton(
            color: Theme.of(context).accentColor,
            child: new Text(
              'ADD TO BAG',
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
