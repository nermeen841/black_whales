
import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/core/data/myAds/model/profileModel/profile_model.dart';
import 'package:black_whales/persentation/Widgets/common_app_bar.dart';
import 'package:black_whales/persentation/chatScreens/managerGlobal.dart';
import 'package:black_whales/persentation/chatScreens/myCircularAvatar.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/following/ui/following_page.dart';
import 'package:black_whales/persentation/features/MainCategory/top_Tabs_Navgation_bar.dart';
import 'package:black_whales/persentation/introdustion/splash_page.dart';
import 'package:black_whales/persentation/profileScreens/editProfileScreen.dart';
import 'package:black_whales/persentation/profileScreens/flowersScreen.dart';
import 'package:black_whales/persentation/profileScreens/myAdsScreen.dart';
import 'package:black_whales/persentation/profileScreens/searchScreen.dart';
import 'package:black_whales/persentation/profileScreens/settingScreens/settingScreen.dart';
import 'package:black_whales/persentation/profileScreens/state/store/my_profile_store/my_profile_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:theme_provider/theme_provider.dart';





class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("=================");
    return Scaffold(
      appBar: CommonAppBar(context , tittel: 'My Profile'),
      body: WhenRebuilderOr<MyProfileStore>(
        initState: (context, rm) => rm.setState((s) => s.getMyProfile()),
        observe: () => RM.get<MyProfileStore>(),
        builder: (context, model) => ProfileScreen(),
        onWaiting: () => CircularProgressIndicator(),//AdsShimmer(),
        onError: (error) => IN.get<MyProfileStore>().myProfileModel == null
            ? Text('$error')
            : ProfileScreen(),
      ),
    );
  }
}



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  MyProfileModel get myProfileModel => IN.get<MyProfileStore>().myProfileModel;


  Color _changeColor(){
    if( ThemeProvider.themeOf(context).id=="light"){
      return Colors.black;
    }

    else{
      return Colors.white;
    }
  }


  Color _getColor(){
    if( ThemeProvider.themeOf(context).id=="light"){
      return  HexColor('#F1E8D5');
    }

    else{
      return Colors.black;
    }
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.only(  left: 20 , right: 20),
            child: Container(
              height:210,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(R.ASSETS_ICONS_BACKICON_SVG , color: _changeColor(), width: 12, height: 12,),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        'INVITE VIA',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              decoration: TextDecoration.none,
                            )
                        ),
                        textAlign: TextAlign.center,

                      ),

                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.only( left: 10 , right: 10 ),
                    child:   Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(R.ASSETS_ICONS_TWITTERSHAREICON_SVG , width: 60, height: 60,),
                            SvgPicture.asset(R.ASSETS_ICONS_WHATSAPPSHAREICON_SVG ,  width: 60, height: 60,),
                            SvgPicture.asset(R.ASSETS_ICONS_MAILSHAREICON_SVG,  width: 60, height: 60,),
                            SvgPicture.asset(R.ASSETS_ICONS_LINKSHAREICON_SVG ,  width: 60, height: 60,),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(R.ASSETS_ICONS_FACEBOOKSHAREICON_SVG ,  width: 60, height: 60,),
                              SvgPicture.asset(R.ASSETS_ICONS_MESSAGESHAREICON_SVG ,  width: 60, height: 60,),
                              SvgPicture.asset(R.ASSET_ICONS_Group_2329_SVG ,  width: 60, height: 60,),
                              SvgPicture.asset(R.ASSET_ICONS_Group_2330_SVG,  width: 60, height: 60,),
                            ]

                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(  left: 10),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: CachedNetworkImage(
                            imageUrl:"https://websitte.black-whales.com/pictures/users/"+ myProfileModel.data.image,
                            fit: BoxFit.cover ,
                            placeholder: (context, url) =>  CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>  Icon(Icons.error , color: Colors.red),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          ),

                        Text( myProfileModel.data.name ,
                          style: GoogleFonts.nunito( textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14 )),),
                        SizedBox( height: 10,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text( 'MEMBER SINCE',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 12 , color: HexColor('#BD884A') )),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox( width: 5,),

                            Text( myProfileModel.data.dateCreate ,
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12 , color: HexColor('#BD884A') )),),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(R.ASSETS_ICONS_CALLICON_SVG , width: 10, height: 10, color: Colors.green,),
                            SizedBox( width: 5,),
                            Text( "VERIFIED",
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12 , color: HexColor('#BD884A') )),),
                          ],
                        ),


                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: 281,
                          height: 60,
                          decoration: BoxDecoration(
                            color: _getColor(),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only( left: 30 , right: 30 , top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      myProfileModel.data.advCount.toString(),
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                    ),

                                    Text(
                                      myProfileModel.data.followingCount.toString(),
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                    ),

                                    Text(
                                      myProfileModel.data.followersCount.toString(),
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox( height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'MY ADS',
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12
                                          )
                                      ),
                                    ),

                                    Text(
                                      'Following',
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12
                                          )
                                      ),
                                    ),

                                    Text(
                                      'Followers',
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                        ),

                      ]
                  ),
                ),


                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only( left: 25),
                  child: Column(
                    children: [

                      InkWell(
                        child:  Row(
                          children: [
                            Icon(Icons.launch , size: 15,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'EDIT PROFILE',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration( milliseconds: 500),
                              child: EditProfileScreen()
                          ));
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            Icon(Icons.keyboard_voice, size: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'MY ADS',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration( milliseconds: 500),
                              child: MyAdsPage()
                          ));
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            Icon(Icons.favorite_border , size: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'FAVOURITE ADS',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute( builder: (_)=>FavouritesPage()));
                          return choices[3];
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            Icon(Icons.search, size: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'RECENT SEARCHES',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration( milliseconds: 500),
                              child: SearchScreen()
                          ));
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            Icon(Icons.person_add ,size: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'FOLLOWING',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute( builder: (_)=>FollowingPage()));
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            Icon(Icons.perm_identity, size: 15,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'FOLLOWERS',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration( milliseconds: 500),
                              child: FollowersPage()
                          ));
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            SvgPicture.asset(R.ASSETS_ICONS_SHAREICON_SVG , color: _changeColor(), width: 15, height: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'INVITE FRIENDS',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          _showModalSheet();
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            SvgPicture.asset(R.ASSET_ICONS_SYMBOLS_SVG , color: _changeColor(), width: 15, height: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'SETTING',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration( microseconds: 500),
                              child: SettingScreen()
                          ));
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child:  Row(
                          children: [
                            Icon( Icons.exit_to_app , size: 15,),

                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'LOG OUT',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute( builder: ( context)=>SplashPage())
                          );
                        },
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









