import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/Ads/ui/ads_page_Details.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AdsListCellCell extends StatelessWidget {
  final String url;
  final double image_height;
  final double image_width;
  AdsListCellCell({this.url, this.image_height, this.image_width});

  @override
  Widget build(BuildContext context) {

    Color _changeColor(){
      if( ThemeProvider.themeOf(context).id=="light"){
        return Colors.white;
      }

      else{
        return Colors.black;
      }
    }



    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AdsPageDetails(url);
        }));
      },
      child: Container(
        height: image_height ?? MediaQuery.of(context).size.height * .125 * .5,
        width: image_width ?? MediaQuery.of(context).size.width * .26,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _changeColor(),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: cachImage(
            url,
            image_height ?? MediaQuery.of(context).size.height * .125 * .5,
            image_width ?? MediaQuery.of(context).size.width * .26,
          ),
        ),
      ),
    );
  }
}
