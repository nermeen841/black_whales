import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/core/data/myAds/model/myAdsmodel.dart';
import 'package:black_whales/persentation/Widgets/common_app_bar.dart';
import 'package:black_whales/persentation/profileScreens/state/store/myAdsStore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';



class MyAdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
print("=================");
    return Scaffold(
      appBar: CommonAppBar(context , tittel: 'MY ADS'),
      body: WhenRebuilderOr<MyAdsStore>(
        initState: (context, rm) => rm.setState((s) => s.getmyAds()),
        observe: () => RM.get<MyAdsStore>(),
        builder: (context, model) => MyAdsScreen(),
        onWaiting: () => CircularProgressIndicator(), //AdsShimmer(),
        onError: (error) => IN.get<MyAdsStore>().myAdsModel == null
            ? Text('$error')
            : MyAdsScreen(),
      ),
    );
  }
}





class MyAdsScreen extends StatelessWidget {

   MyAdsModel get myAdsModel => IN.get<MyAdsStore>().myAdsModel ;

  @override
  Widget build(BuildContext context) {



    Color _changeColor(){
      if( ThemeProvider.themeOf(context).id=="light"){
        return Colors.black;
      }
      else{
        return Colors.white;
      }


    }

    Color _getColor() {
      if( ThemeProvider.themeOf(context).id=="light"){
        return Colors.white;
      }
      else{
        return Colors.black;
      }
    }


    return Padding(
      padding: const EdgeInsets.only( left: 15 , right: 15),
      child: Column(
          children: [
            Container(
              width: 343, //MediaQuery.of(context).size.width*0.9,
              height: 50, //MediaQuery.of(context).size.height*0.1 ,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor('#E6D29D'),),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),

              ),
              child: Padding(
                padding: EdgeInsets.only( left: 10 , right: 10 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          )
                      ),
                    ),
                    SvgPicture.asset(R.ASSETS_ICONS_SEARCHICON_SVG , color: _changeColor(), width: 18, height: 18,),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: 343,
              height: 450,
              child: ListView.builder(
                itemCount: myAdsModel.data[0].adDetails.length ,
                itemBuilder: ( BuildContext context , index){
                  return  SizedBox(
                    width: 343,
                    height: 110,
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      color: _getColor(),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child:  CachedNetworkImage(
                              imageUrl: myAdsModel.data[0].adDetails[index].ad.image,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>  Icon(Icons.error , color: Colors.red,),

                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10 ),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      myAdsModel.data[0].adDetails[index].ad.brandName,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.none,
                                          )
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' 27 / 5 / 2020',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: HexColor('#BD884A'),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 30,
                                  ),

                                  Text(
                                    "Bebo Shop",
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: HexColor('#BD884A'),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),

                                    ),

                                  )
                                ],
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' 500 LE',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: HexColor('#BD884A'),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 60,
                                  ),

                                  Text(
                                    "Mansoura",
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: HexColor('#BD884A'),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )],),],),],),),);},),
            ),
          ]),
    );
  }



}
