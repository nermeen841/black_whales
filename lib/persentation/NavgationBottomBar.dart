import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/chatScreens/bodyChatScreen.dart';
import 'package:black_whales/persentation/profileScreens/profileScreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_provider/theme_provider.dart';
import 'features/MainCategory/top_Tabs_Navgation_bar.dart';
import 'features/message.dart';
import 'insertNewAds.dart';

class NavigationBottomPage extends StatefulWidget {
  NavigationBottomPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavigationBottomPageState createState() => _NavigationBottomPageState();
}

class _NavigationBottomPageState extends State<NavigationBottomPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  int _currentIndex = 0;
  PageController _pageController;
  BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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

    ctx = context;
    return WillPopScope(
      onWillPop: () async {
        // Navigator.of(context).pop(false);
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(title: Text("Nav Bar")),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              TabbedAppBarDemo(),
              message(),
              InsertNewADS(),
              ChatScreen(),
              MyProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          showElevation: false,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home'),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_HOMEICON_SVG,
                  fit: BoxFit.cover,
                ),
                activeColor: ColorD.GOLD_COLOR,
                inactiveColor: Colors.grey[700]),
            BottomNavyBarItem(
                title: Text('Chat'),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_CHATSICON_SVG,
                  fit: BoxFit.cover,
                  color: _changeColor(),
                ),
                activeColor: ColorD.GOLD_COLOR,
                inactiveColor: Colors.grey[700]),
            BottomNavyBarItem(
                title: Text('New Ads'),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_POSTICON_SVG,
                  fit: BoxFit.cover,
                  color: _changeColor(),
                ),
                activeColor: ColorD.GOLD_COLOR,
                inactiveColor: Colors.grey[700]),
            BottomNavyBarItem(
                title: Text('Notification'),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_NOTIFICATIONICON_SVG,
                  fit: BoxFit.cover,
                  color: _changeColor(),
                ),
                activeColor: ColorD.GOLD_COLOR,
                inactiveColor: Colors.grey[700]),
            BottomNavyBarItem(
                title: Text('Profile'),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_PROFILEICON_SVG,
                  fit: BoxFit.cover,
                  color: _changeColor(),

                ),
                activeColor: ColorD.GOLD_COLOR,
                inactiveColor: Colors.grey[700]),
          ],
        ),
      ),
    );
  }


}






