import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/persentation/profileScreens/settingScreens/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theme_provider/theme_provider.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  final _formkey = GlobalKey<FormState>();


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
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only( top: 30 , left: 15 , right: 15  , bottom: 20),
            child: Column(
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
                      'CONTACT US',
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
                  height: 30,
                ),

                Center(
                  child: SvgPicture.asset(R.ASSETS_ICONS_BLACKWHALESLOGO_SVG , ),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Icon( Icons.email , size: 15,),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Email@Jcjlbv..... Kbobl',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: HexColor('#929292'),
                              fontWeight: FontWeight.w600,
                              fontSize: 10
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(R.ASSETS_ICONS_FACEBOOK_SVG , color: _changeColor(), width: 15, height: 15,),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'FacebookKgkclCk,Cc ',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: HexColor('#929292'),
                              fontWeight: FontWeight.w600,
                              fontSize: 10
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset( R.ASSETS_ICONS_ICON_ZOCIALSKYPE_SVG , color: _changeColor(), width: 15, height: 15,),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'A[S;XlcK jqa [ VK , [ SL ]',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: HexColor('#929292'),
                              fontWeight: FontWeight.w600,
                              fontSize: 10
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Or You Can Send Your Feedback Here',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20 , right: 20),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ( value ){
                              if( value.isEmpty){
                                return'this field is required';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: ( value ){
                              if( value.isEmpty){
                                return'this field is required';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: ( value ){
                              if( value.isEmpty){
                                return'this field is required';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Suggestion, Compliant, Issue Or Other',
                              hintStyle: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ( value ){
                              if( value.isEmpty){
                                return'this field is required';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Message',
                              hintStyle: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ( value ){
                              if( value.isEmpty){
                                return'this field is required';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          SizedBox(
                            width: 181,
                            height: 42,
                            child: RaisedButton(
                              color: HexColor('#4AD58B'),
                              child: Text(
                                'SEND' ,
                                style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                    )
                                ),
                              ),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular( 15),
                                    topRight: Radius.circular( 15),
                                    bottomLeft: Radius.circular( 15),
                                    bottomRight: Radius.circular( 15),
                                  )
                              ),

                              onPressed: (){},

                            ),
                          ),

                        ],

                      )
                  ),
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}
