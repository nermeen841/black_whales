import 'package:black_whales/core/data/myAds/model/Followers_Model/Follower_Model.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/Ads/widgets/ads_list_cell_cell.dart';
import 'package:black_whales/persentation/profileScreens/state/store/Followers_Store/Followers_Store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:theme_provider/theme_provider.dart';




class FollowingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("=================");
    return Scaffold(
      body: WhenRebuilderOr<FollowersStore>(
        initState: (context, rm) => rm.setState((s) => s.getFollowers()),
        observe: () => RM.get<FollowersStore>(),
        builder: (context, model) => FollowingListPage(),
        onWaiting: () => CircularProgressIndicator(),//AdsShimmer(),
        onError: (error) => IN.get<FollowersStore>().followersModel == null
            ? Text('$error')
            : FollowingListPage(),
      ),
    );
  }
}










class FollowingListPage extends StatelessWidget {
  final String lable;
  final String image;
  final List<String> adsImages;
  FollowingListPage({this.lable, this.image, this.adsImages});

  FollowersModel get followersModel=> IN.get<FollowersStore>().followersModel;

  @override
  Widget build(BuildContext context) {


    Color _changeColor(){
      if( ThemeProvider.themeOf(context).id=="light"){
        return Colors.white;
      }

      else{
        return Colors.black;
      }
    }



    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .2,
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  creatorImage(
                      context,
                      "https://www.scoopify.org/wp-content/uploads/2016/02/Most-Famous-Person-In-The-World-6.jpg",
                      45),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(followersModel.data[0].userData.name,
                       style: GoogleFonts.nunito(
                         textStyle: TextStyle(
                             fontWeight: FontWeight.w900,
                             fontSize: 10
                         )
                       ),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      Main_text(followersModel.data[0].advsUserCount.toString()+""+"ADS",
                          color: ColorD.GOLD_COLOR,
                          fontWeight: FontWeight.bold,
                          size: 10),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.check_circle_outline,
                color: Colors.green[200],
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .08,
            width: MediaQuery.of(context).size.width * .9,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return AdsListCellCell(
                  url: followersModel.data[0].userData.image,//this.adsImages[i],
                  image_height: 50,
                  image_width: 60,
                );
              },
            ),

            // child: Conti,
          )
        ],
      ),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _changeColor(),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
