import 'package:black_whales/core/color.dart';
import 'package:flutter/material.dart';
import 'managerGlobal.dart';


class SentMessageWidget extends StatelessWidget {
  final int i;
  const SentMessageWidget({
    Key key,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "${messages[i]['time']}",
            style:  TextStyle( color: Colors.grey , fontSize: 12),
          ),
          SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: HexColor('#DFBAA9'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "${messages[i]['message']}",
              style: Theme.of(context).textTheme.body2.apply(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}