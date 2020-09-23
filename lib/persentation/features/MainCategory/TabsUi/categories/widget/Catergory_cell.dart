import 'package:black_whales/core/design_utils.dart';
import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final String image;
  final String lable;
  CategoryCell({this.image, this.lable});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .27,
      width: MediaQuery.of(context).size.width * .43,
      margin: EdgeInsets.all(8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: cachImage(
              this.image,
              MediaQuery.of(context).size.height * .26,
              MediaQuery.of(context).size.width * .43,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * .055,
                width: MediaQuery.of(context).size.width * .43,
                child: Center(
                    child: Main_text(this.lable ?? "-",
                        color: Colors.white,
                        fonthight: 1.2,
                        size: 12,
                        fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(
                  color: ColorD.GOLD_COLOR,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                )),
          )
        ],
      ),
    );
  }
}
