import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

import 'Widgets/commen_text_faild.dart';
import 'Widgets/commn_btn.dart';
import 'Widgets/common_app_bar.dart';


class InsertNewADS extends StatefulWidget {
  @override
  _InsertNewADSState createState() => _InsertNewADSState();
}

class _InsertNewADSState extends State<InsertNewADS> {

  RangeValues _currentRangeValues = const RangeValues(1000, 8000);
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar((context) , tittel: "INSERT AN AD" ),
        body: SingleChildScrollView(
          child: Container(
              child: Padding(
                padding: EdgeInsets.only( left: 10 , right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Center(
                        child: Column(
                          children: [
                            SvgPicture.asset( R.ASSETS_ICONS_IMAGEICON_SVG , ),
                            SizedBox(
                              height: 5,
                            ),

                            Text(
                              'Add Photo',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              'Ads With Photos Sell Up To 5X Faster',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: HexColor('#4AD58B')
                                  )
                              ),
                            ),
                          ],

                        )
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 15 , right: 15 , top: 10),
                      child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextField(
                               decoration: InputDecoration(
                                hintText: "What do you want to sell or advertise? ",
                                 hintStyle: GoogleFonts.nunito(
                                   textStyle: TextStyle(
                                     fontSize: 16,
                                     fontWeight: FontWeight.w400,
                                   )
                                 )
                               ),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                               decoration: InputDecoration(
                                 hintText: "Ad Title",
                                   hintStyle: GoogleFonts.nunito(
                                       textStyle: TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.w400,
                                       )
                                   )
                               ),

                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Ad Description",
                                    hintStyle: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        )
                                    )
                                ),

                              ),

                              SizedBox(
                                height: 20,
                              ),

                             Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   'Select Price Range',
                                   style: GoogleFonts.nunito(
                                       textStyle: TextStyle(
                                           fontSize: 16,
                                           fontWeight: FontWeight.w400
                                       )
                                   ),
                                   textAlign: TextAlign.start,
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),

                                 RangeSlider(
                                   activeColor: HexColor('#D5BF84'),
                                   max: 8000,
                                   min: 1000,
                                   divisions: 5,
                                   values: _currentRangeValues,
                                   labels: RangeLabels(
                                     _currentRangeValues.start.round().toString(),
                                     _currentRangeValues.end.round().toString(),
                                   ),

                                   onChanged: (RangeValues values) {
                                     setState(() {
                                       _currentRangeValues = values;
                                     });
                                   },

                                 ),
                               ],
                             ),

                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                    hintStyle: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        )
                                    )
                                ),

                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                               decoration: InputDecoration(
                                 hintText: "Address",
                               ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              CommenButtom(
                                child: Text(
                                  'Save And Insert Ads',
                                  style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      )
                                  ),
                                ),
                                color: HexColor('#4AD58B'),
                              )

                            ],
                          )



                      ),
                    )

                  ],
                ),
              )
          ),
        )

    );
  }


  Color _getColor(){
    if( ThemeProvider.themeOf(context).id==" light"){
      return Colors.black;
    }
    else{
      return Colors.white;
    }
  }
}
