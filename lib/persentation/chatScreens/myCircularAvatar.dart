import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final String imgUrl;
  const MyCircleAvatar({
    Key key,
    @required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),

      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage("$imgUrl" ),
      ),
    );
  }
}