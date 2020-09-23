import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/core/data/myAds/model/Followers_Model/Follower_Model.dart';
import 'package:black_whales/persentation/profileScreens/state/store/Followers_Store/Followers_Store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:theme_provider/theme_provider.dart';





class FollowersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("=================");
    return Scaffold(
      body: WhenRebuilderOr<FollowersStore>(
        initState: (context, rm) => rm.setState((s) => s.getFollowers()),
        observe: () => RM.get<FollowersStore>(),
        builder: (context, model) => IN.get<FollowersStore>().followersModel == null
            ? CircularProgressIndicator():FlowersScreen(),
//        onData: (cc)=>FlowersScreen(),
        onWaiting: () => CircularProgressIndicator(),//AdsShimmer(),
        onError: (error) => IN.get<FollowersStore>().followersModel == null
            ? Text('$error')
            : FlowersScreen(),
      ),
    );
  }
}









class FlowersScreen extends StatefulWidget {
  @override
  _FlowersScreenState createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {


  Color _changeColor(){
    if( ThemeProvider.themeOf(context).id=="light"){
      return Colors.black;
    }

    else{
      return Colors.white;
    }
  }

FollowersModel get followersModel=> IN.get<FollowersStore>().followersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only( top: 30 , left: 10 , right: 10),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: SvgPicture.asset(R.ASSETS_ICONS_BACKICON_SVG , color: _changeColor() , width: 12, height: 12,),
                    onTap: (){
                      Navigator.pop(context);
                      },
                    ),
                  SizedBox(
                    width: 100,
                  ),

                  Text(
                    'FOLLOWERS',
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
                    width: 80,
                  ),
                  SvgPicture.asset(R.ASSET_ICONS_SYMBOLS_SVG, color: _changeColor(), width: 15, height: 15,),
                  SizedBox(
                    width: 10,
                  ),
                  Icon( Icons.more_vert),
                 ],
                ),
              SizedBox(
                height: 40,
              ),

              Container(
                width: 343, //MediaQuery.of(context).size.width*0.9,
                height: 50, //MediaQuery.of(context).size.height*0.1 ,
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor('#E6D29D'),),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),

                ),
                child: Padding(
                  padding: EdgeInsets.only( left: 10 , right: 10 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                      SvgPicture.asset(R.ASSETS_ICONS_SEARCHICON_SVG , color: _changeColor(), width: 18, height: 18,),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

           SizedBox(
             width: 343,
             height: 74,
             child:   Card(
               shadowColor: Colors.blueGrey,
               elevation: 10,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               child: Padding(
                 padding: EdgeInsets.only( left: 10 , right: 10 ),
                 child: Row(
                   children: [
                     CircleAvatar(
                       backgroundImage: NetworkImage(followersModel.data[0].userData.image),
                     ),
                     SizedBox(
                       width: 10,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: EdgeInsets.only(top: 10 ),
                           child:  Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 followersModel.data[0].userData.name,
                                 style: GoogleFonts.nunito(
                                     textStyle: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                       decoration: TextDecoration.none,
                                     )
                                 ),
                                 textAlign: TextAlign.center,
                               ),

                               SizedBox(
                                 width: 200,
                               ),

                               SvgPicture.asset(R.ASSETS_ICONS_FLAGICON_SVG , color: _changeColor(), width: 20, height: 20,)
                             ],
                           ),
                         ),
                      _getText(),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
              


           ],
    ),
      ),
    ),
    );
  }

  Widget _getText(){
    if(followersModel.data[0].userData.isOnline==1){
      return Row(
        children: [
          SvgPicture.asset(R.ASSETS_ICONS_ONLINEICON_SVG , width: 10, height: 10,),
          SizedBox(
            width: 10,
          ),

          Text(
            "Online",
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: HexColor('#BD884A'),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),

            ),

          )
        ],
      );
    }
    else{
      return Row(
        children: [
          SvgPicture.asset(R.ASSETS_ICONS_ONLINEICON_SVG , color: Colors.blueGrey, width: 10, height: 10,),
          SizedBox(
            width: 10,
          ),

          Text(
            "Offline",
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: HexColor('#BD884A'),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),

            ),

          )
        ],
      );

    }
  }
}
