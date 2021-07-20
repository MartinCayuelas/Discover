import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardCarousel extends StatelessWidget {
  CardCarousel(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFf5f6fa),
      elevation: 0.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'images/$image.png',
            height: 110,
            width: 110,
          ),
        ),
      ),
    );
  }
}
