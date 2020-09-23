
import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/pinCodePages/successCodeVerfication.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/material.dart';


class PinPutTest extends StatefulWidget {
  @override
  PinPutTestState createState() => PinPutTestState();
}

class PinPutTestState extends State<PinPutTest> {

  final color1 = ColorD.BRAWN_BLACK_COLOR;
 final color2 = ColorD.BRAWN_White_COLOR;
 final color3 = ColorD.GOLD_COLOR;




  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(


      border: Border(
        bottom: BorderSide(color: ColorD.GOLD_COLOR,width: 1)
      ),
//      borderRadius: BorderRadius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 80 , left: 40 , right: 40),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Icon(Icons.clear , size: 30, ),
                            onTap: (){

                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text( ' Enter the 4 digit code sent to : ' ,style: GoogleFonts.nunito(
                          textStyle:  TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      ),


                      SizedBox(
                        height:10,
                      ),

                      Text( '01033446676' , style: GoogleFonts.nunito(
                        textStyle:  TextStyle(
                            color: color3,
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                        ),
                      )),

                      SizedBox(
                        height: 10,
                      ),

                      Text( ' we have sent a 4 digit code to your phone number. please enter the code' ,
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            wordSpacing: .5,
                          ),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Column(
                          children: [
                            PinPut(
                              keyboardType: TextInputType.number,

                              fieldsCount: 4,
                              focusNode: _pinPutFocusNode,
                              controller: _pinPutController,
                              submittedFieldDecoration: _pinPutDecoration,
                              selectedFieldDecoration: _pinPutDecoration,
                              followingFieldDecoration:_pinPutDecoration,
                            ),

                            SizedBox(
                              height: 130,
                            ),

                            InkWell(
                              child: Text('Didnot recieve a SMS?' , style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),

                              onTap: (){
                                ///TODO:
                              },
                            ),

                            Text('Request new code in: ' , style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            )),
                            SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 44,
                              width: 308,
                              child:  RaisedButton(
                                  color: color3,
                                  child: Text('REQUEST NEW CODE' , style: GoogleFonts.nunito(
                                    textStyle:  TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600
                                    ),

                                  ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                    Navigator.push( context ,MaterialPageRoute( builder: (context)=>SuccessVerificationScreen()));
                                  }
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
          },
        ),
      );


  }

}