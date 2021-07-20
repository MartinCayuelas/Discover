import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoesapp/customs/Painter.dart';
import 'package:shoesapp/customs/PainterGrey.dart';
import 'package:shoesapp/models/ListShoes.dart';
import 'package:shoesapp/models/shoes_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _brands = [
    'Puma',
    'Nike',
    'Adidas',
    'Reebok',
    'Asics',
    'Umbro',
  ];

  List<Shoes> shoes = ListShoes().listShoesPuma;
  List<Shoes> newShoes = ListShoes().newShoesPuma;

  String currentIndexShoes = 'Puma';
  void _changeListShoes(String brandName) {
    setState(() {
      switch (brandName) {
        case 'Puma':
          {
            shoes = ListShoes().listShoesPuma;
            newShoes = ListShoes().newShoesPuma;
            currentIndexShoes = 'Puma';
          }
          break;
        case 'Adidas':
          {
            shoes = ListShoes().listShoesAdidas;
            newShoes = ListShoes().newShoesAdidas;
            currentIndexShoes = 'Adidas';
          }
          break;
        case 'Nike':
          {
            shoes = ListShoes().listShoesNike;
            newShoes = ListShoes().newShoesNike;
            currentIndexShoes = 'Nike';
          }
          break;
        default:
          {
            shoes = ListShoes().listShoesPuma;
            newShoes = ListShoes().newShoesPuma;
            currentIndexShoes = 'Puma';
          }
          break;
      }
    });
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 400),
    );
  }

  int tabIndex = 0;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: false,
      title: Text(
        'Discover',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 30.0,
          fontFamily: 'JostSB',
          letterSpacing: 1.5,
        ),
      ),
      actions: <Widget>[
        // action button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: Colors.grey.shade200,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.grey.shade200,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.notifications_none),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ],
      elevation: 0.0,
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Color(0xffbbbcc1),
        backgroundColor: Color(0xffededf2),
        currentIndex: tabIndex,
        onTap: (int index) {
          setState(() {
            tabIndex = index;

            if (index == 3) {
              Navigator.pushNamed(
                context,
                '/cart',
              );
              tabIndex = 0;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label:'map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label:'profile',
          ),
        ]);
  }

  Widget _buildBody() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildGallery(),
          _buildMore(),
        ],
      ),
    );
  }

  Widget _buildGallery() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 70,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _brands.length,
            itemBuilder: (BuildContext context, int index) {
              final brand = _brands[index];
              return Container(
                width: 110,
                child: Stack(
                  children: <Widget>[
                    currentIndexShoes == brand
                        ? CustomPaint(
                            painter: CurvePainterGrey(),
                          )
                        : Container(),
                    Center(
                      child: TextButton(
                        child: Text(
                          brand,
                          style: currentIndexShoes == brand
                              ? TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  fontFamily: 'JostSB',
                                  letterSpacing: 1.5,
                                )
                              : TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  fontFamily: 'JostSB',
                                  letterSpacing: 1.5,
                                ),
                        ),
                        onPressed: () {
                          _changeListShoes(brand);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 385,
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: shoes.length,
            itemBuilder: (BuildContext context, int index) {
              final item = shoes[index];
              final itemImage = item.imageName;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                child: Container(
                                  child: Text(
                                    item.brandName.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'JostSB',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                    item.name.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'JostSB',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Container(
                                  child: Text(
                                    '${item.price}€',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'JostSB',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.0),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          color: item.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        width: 265,
                      ),
                      Positioned(
                        top: 85,
                        right: -30,
                        left: 0,
                        child: Image.asset(
                          'images/${item.brandName.toLowerCase()}/$itemImage.png',
                          height: 230,
                          width: 275,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 0,
                        left: 145,
                        child: GestureDetector(
                          child: Image.asset(
                            'images/whiteArrow.png',
                            width: 35,
                            height: 25,
                          ),
                          onTap: () {
                            // Navigate to the second screen using a named route.
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: item,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMore() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                child: Text(
                  'More',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.5,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'JostSB'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
              child: Image.asset(
                'images/arrow.png',
                width: 35,
                height: 25,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 185,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/${newShoes[0].brandName.toLowerCase()}/${newShoes[0].imageName}.png',
                          height: newShoes[0].brandName == 'Adidas' ? 115 : 130,
                          width: newShoes[0].brandName == 'Adidas' ? 115 : 130,
                        ),
                        Text(
                          newShoes[0].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'JostR'),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${newShoes[0].price}€',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'JostR'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  left: 10,
                  child: CustomPaint(
                    painter: CurvePainter(),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 0,
                  left: 14,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JostR',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: 185,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/${newShoes[1].brandName.toLowerCase()}/${newShoes[1].imageName}.png',
                          height: newShoes[1].brandName == 'Adidas' ? 115 : 130,
                          width: newShoes[1].brandName == 'Adidas' ? 115 : 130,
                        ),
                        Text(
                          newShoes[1].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'JostR'),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${newShoes[1].price}€',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'JostR'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  left: 10,
                  child: CustomPaint(
                    painter: CurvePainter(),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 0,
                  left: 14,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JostR',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
