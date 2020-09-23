import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/data/myAds/model/Favourite_Model/Favourite_Model.dart';
import 'package:black_whales/core/data/myAds/model/profileModel/profile_model.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/profileScreens/state/store/Favourite_Store/Favourite_Store.dart';
import 'package:black_whales/persentation/profileScreens/state/store/my_profile_store/my_profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'MainCategory/TabsUi/favourites/widget/favouites_cell.dart';
import 'MainCategory/TabsUi/favourites/widget/favoutites_grid_cell.dart';



class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("=================");
    return Scaffold(
      body: WhenRebuilderOr<MyProfileStore>(
        initState: (context, rm) => rm.setState((s) => s.getMyProfile()),
        observe: () => RM.get<MyProfileStore>(),
        builder: (context, model) => PersonPage(),
        onWaiting: () => CircularProgressIndicator(),//AdsShimmer(),
        onError: (error) => IN.get<MyProfileStore>().myProfileModel == null
            ? Text('$error')
            : PersonPage(),
      ),
    );
  }
}






class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  BuildContext ctx;
  int check = 1;
  MyProfileModel get myProfileModel => IN.get<MyProfileStore>().myProfileModel;
  FavouritesModel  get favouritesModel => IN.get<FavouriteStore>().favouritesModel;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          creatorData(),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Main_text("ADS.", fontWeight: FontWeight.w700),
                Row(
                  children: [
                    _sort_image(R.ASSETS_ICONS_VIEWLISTICON_SVG, 1),
                    SizedBox(
                      width: 12,
                    ),
                    _sort_image(R.ASSETS_ICONS_COMFYLISTICON_SVG, 0),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )
              ],
            ),
          ),
          check == 1 ? _list_view() : _grid_view(),
        ],
      ),
    );
  }

  _sort_image(String image, int checkk) {
    return InkWell(
      onTap: () {
        if (check != checkk) {
          setState(() {
            check = checkk;
          });
        }
      },
      child: SvgPicture.asset(
        image,
        height: 15,
        width: 15,
      ),
    );
  }

  _list_view() {
    return Expanded(
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: FavouriteCell(
                    url:
                        "https://www.scoopify.org/wp-content/uploads/2016/02/Most-Famous-Person-In-The-World-6.jpg",
                    isprofile: true,
                  ),
                ),
              ),
            );
          }),
    );
  }

  _grid_view() {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Wrap(
            children: List.generate(8, (index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: Duration(milliseconds: 250),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: FavouriteGridCell(
                      url:
                          "https://www.scoopify.org/wp-content/uploads/2016/02/Most-Famous-Person-In-The-World-6.jpg",
                      isprofile: true,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  creatorData() {

    return card_container(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(ctx).pop(),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.flag)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                creatorImage(
                    ctx,
                    "https://websitte.black-whales.com/pictures/users/"+myProfileModel.data.image,
                    50),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(myProfileModel.data.name,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 12
                        )
                      ),
                       ),
                    SizedBox(
                      height: 15,
                    ),
                    _rowData( myProfileModel.data.followingCount.toString(), myProfileModel.data.followersCount.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 14,
                          color: Colors.green,
                        ),
                        Text("ONLINE",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: ColorD.BRAWN_BLACK_COLOR,
                                fontWeight: FontWeight.w700
                            )
                          ),
                            ),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.call,
                          size: 14,
                          color: Colors.green,
                        ),
                        Text("VERIFIED",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                               fontSize: 12,
                                color: ColorD.BRAWN_BLACK_COLOR,
                                fontWeight: FontWeight.w700
                            )
                          ),
                           )
                      ],
                    ),
                    Text("Member Since"+""+myProfileModel.data.dateCreate,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: ColorD.BRAWN_BLACK_COLOR,
                            fontWeight: FontWeight.w700
                        )
                      ),
                       ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Row(
                children: [
                  _callbtn(favouritesModel.data[0].adDetails[0].user.phone, Icons.call, Colors.green[300],
                      () => print("mahmoud")),
                  SizedBox(
                    width: 15,
                  ),
                  _callbtn("CHAT", Icons.add, ColorD.GOLD_COLOR,
                      () => print("mahmoud")),
                  SizedBox(
                    width: 15,
                  ),
                  _callbtn("FOLLOW", Icons.add, ColorD.GOLD_COLOR,
                      () => print("mahmoud"))
                ],
              ),
            )
          ],
        ),
        MediaQuery.of(ctx).size.width , context);
  }

  _rowData(String following, String follower) {
    return Row(
      children: [
        Column(
          children: [
            Text(following, style: GoogleFonts.nunito( textStyle: TextStyle( fontWeight: FontWeight.w700, fontSize: 12)),),
            Text("Following", style: GoogleFonts.nunito( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),)
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          children: [
            Text(follower, style: GoogleFonts.nunito( textStyle: TextStyle( fontWeight: FontWeight.w700, fontSize: 12)),),
            Text("Follower", style: GoogleFonts.nunito( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),)
          ],
        ),
      ],
    );
  }

  _callbtn(String lable, IconData icon, Color color, Function fun) {
    return InkWell(
      onTap: fun,
      child: Container(
        // width: MediaQuery.of(ctx).size.width * .35,
        padding: EdgeInsets.only(right: 15, left: 15),
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 14,
                color: Colors.white,
              ),
              Main_text(lable, size: 10, fonthight: 1.5, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
