import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/Widgets/commen_text_faild.dart';
import 'package:black_whales/persentation/Widgets/commn_btn.dart';
import 'package:black_whales/persentation/Widgets/common_app_bar.dart';
import 'package:black_whales/persentation/features/auth/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../NavgationBottomBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext ctx;
  bool check = false;
  TextEditingController _username = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return CommonAppBar(
      ctx,
      tittel: "LOG IN",
    );
  }

  _body() {
    return Container(
      width: MediaQuery.of(ctx).size.width,
      height: MediaQuery.of(ctx).size.height,
      padding: EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _divide(),
            _main_text(),
            _divide(),
            _sub_main_text(),
            _divide(h: MediaQuery.of(ctx).size.height * .07),
            _email_text_faild(),
            _divide(),
            _password_text_faild(),
            _divide(),
            _terms_condiction_check(),
            // _divide(),
            _login_btn(),
            _google_login(),
            _facebook_login(),
            _divide(),
            _forgetPassword(),
            _divide(),
            _havenotAccount(),
          ],
        ),
      ),
    );
  }

  _forgetPassword() {
    return Text("Forget Password?", style: GoogleFonts.nunito(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 12
      )
    ),);
  }

  _havenotAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Don't have an account ?",
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 12
            )
          ),
           ),
        InkWell(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    // duration: Duration(milliseconds: 500),
                    type: PageTransitionType.rightToLeft,
                    child: SignUpPage())),
            child: Main_text("Sign Up", fontWeight: FontWeight.bold, size: 12)),
      ],
    );
  }

  _facebook_login() {
    return CommenButtom(
      color: Colors.transparent,
      borderColor: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.facebookF,
            size: 14,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          Main_text("Continue with Facebook",
              color: Colors.blue, size: 12, fonthight: 2)
        ],
      ),
      // fontColor: Colors.white,
    );
  }

  _login_btn() {
    return CommenButtom(
      text: "SIGN IN",
      fontColor: Colors.white,
      function: () => Navigator.push(
          context,
          PageTransition(
              // duration: Duration(milliseconds: 500),
              type: PageTransitionType.downToUp,
              child: NavigationBottomPage())),
    );
  }

  _google_login() {
    return CommenButtom(
      color: Colors.transparent,
      borderColor: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.google,
            size: 14,
            color: Colors.red,
          ),
          SizedBox(
            width: 20,
          ),
          Main_text("Continue with Google",
              color: Colors.red, size: 12, fonthight: 2)
        ],
      ),
      // fontColor: Colors.white,
    );
  }

  _email_text_faild() {
    return TextFormField(
      controller: _username,
      decoration: InputDecoration(
        hintStyle:  GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
        ),
        hintText:  "Username or email",
      ),
    );
  }

  _password_text_faild() {
    return TextFormField(
      controller: _username,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle:  GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
        ),

      ),
    );
  }

  _divide({double h}) {
    return SizedBox(
      height: h ?? 20,
    );
  }

  _sub_main_text() {
    return Text("Welcom back, you've been missed!",
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14
        )
      ),
       );
  }

  _main_text() {
    return Text(
      "Let's sign you in",
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
        )
      ),
    );
  }

  _terms_condiction_check() {
    return Row(
      children: [
        Checkbox(
          value: check,
          onChanged: (val) {
            setState(() {
              check = val;
            });
          },
        ),
        Text("By signing in tou agree to our privacy policy",
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 10
            )
          ),
           )
      ],
    );
  }
}
