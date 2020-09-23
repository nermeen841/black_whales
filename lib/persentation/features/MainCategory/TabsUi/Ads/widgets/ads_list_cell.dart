import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/Ads/ui/view_more_ads_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

import 'ads_list_cell_cell.dart';

class AdsListPage extends StatelessWidget {
  final String lable;
  AdsListPage({this.lable});
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


    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .2,
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(lable ?? "-",
                style: GoogleFonts.nunito( textStyle: TextStyle( fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ViewMoreAdsPage();
                  }));
                },
                child: Text("VIEW MORE >>",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold
                    )
                  ),
                    ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .125,
            width: MediaQuery.of(context).size.width * .9,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return AdsListCellCell(
                    url: "https://i.pinimg.com/474x/d1/ea/76/d1ea7692e171b2b42939192998442223.jpg");
              },
            ),

            // child: Conti,
          )
        ],
      ),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _changeColor() ,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
