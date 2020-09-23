import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/persentation/NavgationBottomBar.dart';
import 'package:black_whales/persentation/profileScreens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theme_provider/theme_provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  Color _changeColor(){
    if( ThemeProvider.themeOf(context).id=="light"){
      return Colors.black;
    }

    else{
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Padding(
          padding: const EdgeInsets.only( top: 30 , left: 10 , right: 10),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
             mainAxisAlignment: MainAxisAlignment.start,
               children: [
                InkWell(
                   child: SvgPicture.asset(R.ASSETS_ICONS_BACKICON_SVG , color: _changeColor(), width: 12, height: 12,),
                    onTap: (){
                      Navigator.pop(context);
                  },
                 ),
                 SizedBox(
                   width: 100,
                    ),

                  Text(
                    'SEARCH BLACK WHEELS',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          decoration: TextDecoration.none,)
                          ),
                    textAlign: TextAlign.center,

         ),
               ],
              ),

                SizedBox(
                  height: 40,
                ),

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
                        SvgPicture.asset(R.ASSETS_ICONS_SEARCHICON_SVG , color: _changeColor() , width: 18, height: 18,),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Text(
                  'LATEST SEARCH',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: HexColor('#BD884A'),
                      decoration: TextDecoration.none,
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

               Container(
                 height: 130,
                 child:   ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: 5,
                   itemBuilder: ( BuildContext context , index){
                       return  Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             width: 100,
                             height: 100,
                             child:    ClipRRect(
                               child: Image.network('https://cdn.pixabay.com/photo/2019/11/06/17/26/gear-4606749_960_720.jpg' , fit: BoxFit.cover,),
                               borderRadius: BorderRadius.circular( 20),
                             ),
                           ),

                           Text(
                             'BOURCH',
                             style: GoogleFonts.nunito(
                               fontWeight: FontWeight.w600,
                               fontSize: 12,
                               decoration: TextDecoration.none,
                             ),
                           ),


                         ],

                       );
                   },

                   ),
                 ),


                SizedBox(
                  height: 30,
                ),

                Text(
                  'SUGGESTED SEARCH',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: HexColor('#BD884A'),
                        decoration: TextDecoration.none,
                      )
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 10 , left: 20 , right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '- CARS FOR SALE ',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )
                            ),
                          ),
                          
                          SvgPicture.asset(R.ASSETS_ICONS_DOUBLEARROWICON_SVG , width: 10, height: 10,)
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '- FIAT 128 ',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                          ),

                          SvgPicture.asset(R.ASSETS_ICONS_DOUBLEARROWICON_SVG , width: 10, height: 10,)
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '- VERNA ',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                          ),

                          SvgPicture.asset(R.ASSETS_ICONS_DOUBLEARROWICON_SVG , width: 10, height: 10,)
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '- MERCEDES ',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                          ),

                          SvgPicture.asset(R.ASSETS_ICONS_DOUBLEARROWICON_SVG , width: 10, height: 10,)
                        ],
                      ),
                    ],
                  ),
                )




         ],
    ),


        ),
      ),
      
    );
  }
}
