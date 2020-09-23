import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'managerGlobal.dart';


class ReceivedMessagesWidget extends StatelessWidget {
  final int i;
  const ReceivedMessagesWidget({
    Key key,
    @required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2 , horizontal: 2),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xfff9f9f9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: messageText( context),
          ),
          Text(
            "${messages[i]['time']}",
            style: TextStyle( color: Colors.grey , fontSize: 12),
          ),
        ],
      ),
    );

  }

  Widget messageText( BuildContext context ){

    if( messages[i]['message'] ==Image.asset(' build/app/assets/image/FB_IMG_1587566576569.jpg' , fit: BoxFit.cover,) ){
      return Image.asset( messages[i]['Img']);
    }
    else{
      return Text(
        "${messages[i]['message']}",
        style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
      );

    }
  }






}