import 'dart:async';

import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/design_utils.dart';

import 'package:black_whales/persentation/Widgets/Logo.dart';
import 'package:black_whales/persentation/Widgets/commn_btn.dart';
import 'package:black_whales/persentation/introdustion/choose_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool show = false;
  double _width;
  double _height;

  @override
  void initState() {
    nav();
    super.initState();
  }

  nav() {
    Timer(Duration(seconds: 1), () async {
      setState(() {
        show = true;
      });
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return CountryPage();
      // }));
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: _width,
              height: _height * .5,
              margin: EdgeInsets.only(bottom: _height * .13),
              child: Stack(
                children: [
                  animated_widget(),
                  _animated_logo(),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: show ? 1 : 0,
              child: CommenButtom(
                text: "Next",
                fontColor: Colors.white,
                function: () => _navgtion_to_choose_page(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _navgtion_to_choose_page() {
    // return Navigator.push(context, SlideRightRoute(page: ChoosePage()));
    return Navigator.push(
        context,
        PageTransition(
            // duration: Duration(milliseconds: 500),
            ctx: context,
            type: PageTransitionType.rightToLeft,
            child: ChoosePage()));
  }

  animated_widget() {
    return Positioned(
      bottom: 10,
      child: AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: show ? 1 : 0,
        child: Container(
          width: _width,
          child: Column(
            children: [
              generalCon("Select Language", context, showDilag),
              generalCon("Select Country", context, showDilag)
            ],
          ),
        ),
      ),
    );
  }

  _animated_logo() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      bottom: show ? _height * .23 : 50,
      right: _width / 3.3,
      child: Container(
        width: 140,
        height: 110,
        child: Column(
          children: [
            SvgPicture.asset( R.ASSETS_ICONS_BLACKWHALESLOGOGOLD_SVG , width: 135, fit: BoxFit.cover,),
            SizedBox( height: 5,),
            Text(
              'BLACK WHEELS',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ],
        ),
      ),
    );
  }



  showDilag() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            actions: [
              Container(
                child: Text("mahmoud"),
              )
            ],
          );
        });
  }
}
