import 'package:black_whales/core/data/myAds/model/Favourite_Model/Favourite_Model.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/profileScreens/state/store/Favourite_Store/Favourite_Store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:theme_provider/theme_provider.dart';




class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("=================");
    return Scaffold(
      body: WhenRebuilderOr<FavouriteStore>(
        initState: (context, rm) => rm.setState((s) => s.getFavourite()),
        observe: () => RM.get<FavouriteStore>(),
        builder: (context, model) => FavouriteCell(),
        onWaiting: () => CircularProgressIndicator(),//AdsShimmer(),
        onError: (error) => IN.get<FavouriteStore>().favouritesModel == null
            ? Text('$error')
            : FavouriteCell(),
      ),
    );
  }
}






class FavouriteCell extends StatefulWidget {
  final String url;
  final bool isprofile;
  FavouriteCell({this.url, this.isprofile});

  @override
  _FavouriteCellState createState() => _FavouriteCellState();
}

class _FavouriteCellState extends State<FavouriteCell> {
 FavouritesModel  get favouritesModel => IN.get<FavouriteStore>().favouritesModel;
  bool isfavourite = false;
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
      child: Row(
        children: [
          _adsImage(
              "https://i.pinimg.com/474x/d1/ea/76/d1ea7692e171b2b42939192998442223.jpg"),
          Container(
            // height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .55,
            padding: EdgeInsets.only(left: 15, right: 15),
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 11,
                ),
                _adsName(favouritesModel.data[0].adDetails[0].ad.title),
                SizedBox(
                  height: 11,
                ),
                _elHaga(favouritesModel.data[0].adDetails[0].ad.brandName, "Bobe Shop"),
                SizedBox(
                  height: 10,
                ),
                _elHaga(favouritesModel.data[0].adDetails[0].ad.price.toString(),
                    favouritesModel.data[0].adDetails[0].ad.city),
                SizedBox(
                  height: 20,
                ),
                widget.isprofile == null ? _creator_Data() : Container(),
              ],
            ),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * .9,
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

  _adsImage(String adsimge) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
      child: cachImage(
        favouritesModel.data[0].adDetails[0].ad.image,
        widget.isprofile == null
            ? MediaQuery.of(context).size.height * .2
            : MediaQuery.of(context).size.height * .15,
        MediaQuery.of(context).size.width * .35,
      ),
    );
  }

  _adsName(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: GoogleFonts.nunito( textStyle: TextStyle( fontWeight: FontWeight.w900, fontSize: 10)),),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isfavourite = !isfavourite;
            });
          },
          child: Icon(
            isfavourite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  _elHaga(String first, String second) {
    return Row(
      children: [
        Main_text(first,
            color: ColorD.GOLD_COLOR, fontWeight: FontWeight.bold, size: 13),
        SizedBox(
          width: 15,
        ),
        Main_text(second,
            color: ColorD.GOLD_COLOR, fontWeight: FontWeight.bold, size: 13),
      ],
    );
  }

  _creator_Data() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          creatorImage(
              context,
              "https://i.pinimg.com/474x/d1/ea/76/d1ea7692e171b2b42939192998442223.jpg",
              30),
          Container(
            child: _child(Icons.call, "CAll", Colors.green[300]),
          ),
          Container(
            child: _child(Icons.message, "CHAT", ColorD.GOLD_COLOR),
          )
        ],
      ),
    );
  }

  _child(IconData icon, String lable, Color color) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * .55 * .3,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 13,
            color: Colors.white,
          ),
          Main_text(" " + lable + " ",
              size: 8, fonthight: 1.5, color: Colors.white)
        ],
      ),
    );
  }
}
