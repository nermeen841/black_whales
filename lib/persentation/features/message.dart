import 'package:flutter/material.dart';

import 'MainCategory/TabsUi/Ads/ui/ads_page_Details.dart';

class message extends StatefulWidget {
  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AdsPageDetails(
                  "https://i.pinimg.com/474x/d1/ea/76/d1ea7692e171b2b42939192998442223.jpg");
            }));
          },
          child: Center(child: Text("mahmoud"))),
    );
  }
}
