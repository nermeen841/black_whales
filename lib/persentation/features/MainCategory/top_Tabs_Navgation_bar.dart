import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/Widgets/commn_btn.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/favourites/widget/favouites_cell.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:theme_provider/theme_provider.dart';
import 'TabsUi/Ads/ui/ads_Page.dart';
import 'TabsUi/categories/ui/category_page.dart';
import 'TabsUi/favourites/ui/favourites_page.dart';
import 'TabsUi/following/ui/following_page.dart';
import 'TabsUi/following/widgets/following_list_cell.dart';

class TabbedAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Color _changeColor(){
      if( ThemeProvider.themeOf(context).id=="light"){
        return Colors.black;
      }

      else{
        return Colors.white;
      }
    }


    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            CommenButtom(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              borderColor: ColorD.GOLD_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search"),
                  SvgPicture.asset(
                    R.ASSETS_ICONS_SEARCHICON_SVG,
                    fit: BoxFit.cover,
                    color: _changeColor(),
                  )
                ],
              ),
            ),
            TabBar(
              isScrollable: true,
              labelColor: _changeColor(),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              indicatorColor: ColorD.GOLD_COLOR,
              unselectedLabelStyle: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, height: 3),
              labelStyle: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, height: 3),
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              // color: ,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return cachImage(
                      "https://joahbox.com/wp-content/uploads/k-makeup-look-banner.jpg",
                      MediaQuery.of(context).size.height * .2,
                      MediaQuery.of(context).size.width);
                },
                itemCount: 3,
                autoplay: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: choices.map((Choice choice) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: choice.page,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Transform.translate(
          offset: Offset(0, 15),
          child: SvgPicture.asset(
            R.ASSETS_ICONS_BLACKWHALESLOGOGOLD_SVG,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  final Widget page;
  const Choice({this.title, this.icon, this.page});
}

List<Choice> choices = <Choice>[
  Choice(title: 'Ads.', icon: Icons.directions_car, page: AdsPage()),
  Choice(title: 'Categories', icon: Icons.directions_bike, page: Category()),
  Choice(
      title: 'Favourites', icon: Icons.directions_bus, page: FavouriteScreen()),
  Choice(
      title: 'Following',
      icon: Icons.directions_railway,
      page: FollowingScreen()),
];
