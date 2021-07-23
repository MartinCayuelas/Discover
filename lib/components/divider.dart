import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.grey.shade300,
      thickness: 1,
    );
  }
}
