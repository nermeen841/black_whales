import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/persentation/profileScreens/settingScreens/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theme_provider/theme_provider.dart';

class CommercialRecordScreen extends StatefulWidget {
  @override
  _CommercialRecordScreenState createState() => _CommercialRecordScreenState();
}

class _CommercialRecordScreenState extends State<CommercialRecordScreen> {




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
        child: Padding(
          padding: EdgeInsets.only( top: 30 , left: 10 , right: 20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: SvgPicture.asset(R.ASSETS_ICONS_BACKICON_SVG , color: _changeColor(), width: 12, height: 12,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute( builder: (context)=>SettingScreen()));
                  },
                 ),
                   SizedBox(
                     width: 100,
                    ),

                  Text(
                     'COMMERCIAL REGISTER',
                     style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                        decoration: TextDecoration.none,
                       )
                     ),
                   textAlign: TextAlign.center,

                  ),
            ],
            ),

              SizedBox(
                height: 50,
              ),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Do You Have A Commercial Register ?',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        )
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Upload It Now So We Can Verify Your Identity ',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          )
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'To Provide You And Your Customers  ',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          )
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'The Best Service ',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          )
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),

                   SizedBox(
                     height: 15,
                   ),



                   Padding(
                     padding: EdgeInsets.only( left: 50 , right: 50),
                     child:  InkWell(
                       child:  Container(
                         width: 169,
                         height: 42,
                         decoration: BoxDecoration(
                           color: HexColor('#4AD58B'),
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(15),
                             topLeft: Radius.circular(15),
                             bottomLeft: Radius.circular(15),
                             bottomRight: Radius.circular(15),
                           ),),
                         child: Center(
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               SvgPicture.asset(R.ASSETS_ICONS_IMAGEICON_SVG ,  width: 15, height: 15,),
                               SizedBox(
                                 width: 10,
                               ),
                               Text(
                                 'UPLOAD' ,
                                 style: GoogleFonts.nunito(
                                     textStyle: TextStyle(
                                       color: Colors.white,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w600,
                                     )
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
                     ),
                   ),

                  ],
                ),
              ),
            ],
            ),
            ),
      ),

    );
  }
}
