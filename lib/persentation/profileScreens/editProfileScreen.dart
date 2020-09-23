import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/persentation/profileScreens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

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
            padding: EdgeInsets.only( top: 30 , left: 10),
            child: Column(
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
                      width: 110,
                    ),

                    Text(
                      'EDIT PROFILE',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            decoration: TextDecoration.none,
                          )
                      ),
                      textAlign: TextAlign.center,

                    ),
                    SizedBox(
                      width: 110,
                    ),
                    InkWell(
                      child: SvgPicture.asset(R.ASSETS_ICONS_TRUEICON_SVG , color: HexColor('#4AD58B'), width: 12, height: 12,),
                      onTap: (){
                        ///TODO: save changes to database
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(R.ASSETS_ICONS_IMAGEICON_SVG , ),
                        SizedBox(
                          height: 20,
                        ),

                        Text(
                          'Choose Photo',
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                decoration: TextDecoration.none,
                              )
                          ),
                        ),
                      ],
                    )
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20 , right: 20),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'First Name',
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
                              hintText: 'Last Name',
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
                              hintText: 'E-mail',
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
                              hintText: 'Select Gender',
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
                              hintText: 'Select Birthday',
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
                              hintText: 'Change Password',
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
                        ],
                      )
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Build Trust',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('ADS With Photos Only' ,
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    color: HexColor('#929292'),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                          ),

                          Transform.scale(
                            scale: 0.7,
                            child:  Switch(
                              value: false,
                              activeColor: Colors.blue,
                              onChanged: (bool value ){},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ADS With Price Only' ,
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    color: HexColor('#929292'),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                          ),

                          Transform.scale(
                            scale: 0.7,
                            child:  Switch(
                              value: false,
                              activeColor: Colors.blue,
                              onChanged: (bool value ){},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Show Search Result In English Only' ,
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    color: HexColor('#929292'),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                          ),

                          Transform.scale(
                            scale: 0.7,
                            child:  Switch(
                              value: false,
                              activeColor: Colors.blue,
                              onChanged: (bool value ){},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
