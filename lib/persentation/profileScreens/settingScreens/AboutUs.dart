import 'package:black_whales/persentation/Widgets/common_app_bar.dart';
import 'package:black_whales/persentation/profileScreens/state/store/privacy_policystore/privacy_policy_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';




class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("=================");
    return Scaffold(
      appBar: CommonAppBar(context , tittel: 'About Us'),
      body: WhenRebuilderOr<PrivacyPolicyStore>(
        initState: (context, rm) => rm.setState((s) => s.getprivacypolicy()),
        observe: () => RM.get<PrivacyPolicyStore>(),
        builder: (context, model) => AboutUsScreen(),
        onWaiting: () => CircularProgressIndicator(),//AdsShimmer(),
        onError: (error) => IN.get<PrivacyPolicyStore>().privacyPolicyModel == null
            ? Text('$error')
            : AboutUsScreen(),
      ),
    );
  }
}





class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

 final privacyPolicyModel = IN.get<PrivacyPolicyStore>().privacyPolicyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          privacyPolicyModel.data[0].who,
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  decoration: TextDecoration.none
              )
          ),
        ),
      )
    );

  }
}
