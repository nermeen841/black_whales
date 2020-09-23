import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/features/MainCategory/top_Tabs_Navgation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NavgationBottomBar.dart';



class SuccessVerificationScreen extends StatefulWidget {
  @override
  _SuccessVerificationScreenState createState() => _SuccessVerificationScreenState();
}

class _SuccessVerificationScreenState extends State<SuccessVerificationScreen> with SingleTickerProviderStateMixin {

final col1 = ColorD.MINT_GREEN_COLOR;
final col2 = ColorD.GREEN_COLOR;
final assetname = R.ASSETS_ICONS_VERFIDEICON_SVG;


  Animation animation;
  AnimationController animationController;


  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 2.0).animate(animationController);

    animationController.addStatusListener(animationStatusListener);
    animationController.forward();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
    //  animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only( top: 80),
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget child) {
                      final size = 50*(animationController.value+1);
                      return Center(
                        child:  Container(
                          child: Container(
                              width:animation.value*30,
                              height: animation.value*30,
                              alignment: Alignment.center,
                              child: Image.asset("assets/icons/PhoneVerifiedIcon.png") ),
                          width: animation.value*140,
                          height: animation.value*140,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 70,),

                Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: Column(
                    children: [
                      Text(
                          'Phone Verified',
                          style: GoogleFonts.nunito(
                            textStyle:  TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Congratulations your phone number has been' ,
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        ' verified . you can now start the app' ,
                        style:  GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.center,

                      ),


                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 44,
                  width: 308,
                  child:  RaisedButton(
                    color: col2,
                    child: Text('CONTINUE' , style: GoogleFonts.nunito(
                      textStyle:  TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBottomPage()));
                    },
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
