import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/persentation/Widgets/Logo.dart';
import 'package:black_whales/persentation/Widgets/commn_btn.dart';
import 'package:black_whales/persentation/features/auth/ui/login_page.dart';
import 'package:black_whales/persentation/features/auth/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theme_provider/theme_provider.dart';

// ignore: must_be_immutable
class ChoosePage extends StatelessWidget {
  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      body: body(),
    );
  }


  body() {
    return Container(
      width: MediaQuery.of(ctx).size.width,
      height: MediaQuery.of(ctx).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
         Column(
              children: [
                SvgPicture.asset( R.ASSETS_ICONS_BLACKWHALESLOGOGOLD_SVG , width: 130, height: 97,),
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

          SizedBox(
            height: 50,
          ),
          CommenButtom(
            text: "LOG IN",
            fontColor: Colors.white,
            function: () => _navgtion_to(LoginPage()),
          ),
          CommenButtom(
            color: Colors.transparent,
            text: "SIGN UP",
            fontColor:  _changeColor(ctx),
            borderColor: HexColor('#BFAB75'),
            function: () => _navgtion_to(SignUpPage()),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Skip >>" , style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14
            )
          ),)
        ],
      ),
    );
  }

  Color _changeColor( BuildContext context){
    if( ThemeProvider.themeOf(context).id=="light"){
      return Colors.black;
    }

    else{
      return Colors.white;
    }
  }

  _navgtion_to(Widget page) {
    // return Navigator.push(context, SlideRightRoute(page: ChoosePage()));
    return Navigator.push(
        ctx,
        PageTransition(
            // duration: Duration(milliseconds: 500),
            ctx: ctx,
            type: PageTransitionType.downToUp,
            child: page));
  }


}
