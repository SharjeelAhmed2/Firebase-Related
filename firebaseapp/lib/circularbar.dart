import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircularBar extends StatelessWidget {
  const CircularBar({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitRotatingCircle(
          color: Colors.pink,
          size: 50,
        ),
      ),
    );
  }
}