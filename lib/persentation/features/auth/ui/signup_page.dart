import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/Widgets/commen_text_faild.dart';
import 'package:black_whales/persentation/Widgets/commn_btn.dart';
import 'package:black_whales/persentation/Widgets/common_app_bar.dart';
import 'package:black_whales/persentation/features/auth/ui/login_page.dart';
import 'package:black_whales/persentation/pinCodePages/pinCodePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:theme_provider/theme_provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      tittel: "REGISTER",
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
            _username_text_faild(),
            _divide(),
            _email_text_faild(),
            _divide(),
            _password_text_faild(),
            _divide(),
            _phone_text_faild(),
            _divide(),
            _terms_condiction_check(),
            // _divide(),
            _signup_btn(),
            // _google_login(),
            // _facebook_login(),
            // _divide(),
            // _forgetPassword(),
            _divide(),
            _alreadyhaveaccount(),
          ],
        ),
      ),
    );
  }

  _signup_btn() {
    return CommenButtom(
      text: "SIGN UP",
      fontColor: Colors.white,
      function: (){
        Navigator.pop(context);
        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft , child: PinPutTest() ));
      },
    );
  }

  _divide({double h}) {
    return SizedBox(
      height: h ?? 20,
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
        )
      ),
    );
  }

  _sub_main_text() {
    return Text("Sign up to see our products",
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 14
        )
      ),
    );
  }

  _username_text_faild() {
    return TextFormField(
      controller: _username,
      decoration: InputDecoration(
        hintText: "UserName",
        hintStyle:  GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
        )
      ),
    );
  }

  _email_text_faild() {
    return TextFormField(
      controller: _username,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email ",
        hintStyle:  GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
        )
      ),
    );
  }

  _phone_text_faild() {
    return TextFormField(
      controller: _username,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText:  "Phone ",
        hintStyle:  GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
        )
      ),
    );
  }

  _main_text() {
    return Text(
      "Create your account",
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
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
           ), )
      ],
    );
  }

  _alreadyhaveaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Already have an account ?",
           style: GoogleFonts.nunito(
             textStyle: TextStyle(
                 fontWeight: FontWeight.w300, fontSize: 12
             )
           ),),
        InkWell(
            onTap: () => Navigator.push(
                ctx,
                PageTransition(
                    // duration: Duration(milliseconds: 500),
                    type: PageTransitionType.leftToRight,
                    child: LoginPage())),
            child: Text("Sign in", style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold, fontSize: 12
            ),)),
      ],
    );
  }
}
