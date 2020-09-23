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
        builder: (context, model) => FavouriteGridCell(),
        onWaiting: () => CircularProgressIndicator(),
        //AdsShimmer(),
        onError: (error) => IN.get<FavouriteStore>().favouritesModel == null ? Text('$error') : FavouriteGridCell(),
      ),
    );
  }

}






class FavouriteGridCell extends StatefulWidget {
  final String url;
  final bool isprofile;
  FavouriteGridCell({this.url, this.isprofile});

  @override
  _FavouriteGridCellState createState() => _FavouriteGridCellState();
}

class _FavouriteGridCellState extends State<FavouriteGridCell> {
  FavouritesModel  get favouritesModel=> IN.get<FavouriteStore>().favouritesModel;
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          _adsImage(
              favouritesModel.data[0].adDetails[0].ad.image),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
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
                    favouritesModel.data[0].adDetails[0].ad.city
                ),
                SizedBox(
                  height: 20,
                ),
                widget.isprofile == null ? _creator_Data() : Container(),
              ],
            ),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * .4,
      // height: widget.isprofile == null
      //     ? MediaQuery.of(context).size.height * .2
      //     : MediaQuery.of(context).size.height * .15,
      // padding: EdgeInsets.only(right: 15, left: 15),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _getColor(),
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
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: Stack(
        children: [
          cachImage(
            adsimge,
            widget.isprofile == null
                ? MediaQuery.of(context).size.height * .2
                : MediaQuery.of(context).size.height * .15,
            MediaQuery.of(context).size.width * .4,
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  isfavourite = !isfavourite;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isfavourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _adsName(String name) {
    return Text(name,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
           fontWeight: FontWeight.w900,
            fontSize: 10
        )
      ),
        );
  }

  _elHaga(String first, String second) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Row(
        children: [
          Text(first,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  color: ColorD.GOLD_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 13
              )
            ),
              ),
          SizedBox(
            width: 15,
          ),
          Text(second,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  color: ColorD.GOLD_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 13
              )
            ),
              ),
        ],
      ),
    );
  }

  _creator_Data() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        creatorImage(
            context,
            favouritesModel.data[0].adDetails[0].ad.image,
            30),
        Container(
          child: _child(Icons.call, "CAll", Colors.green[300]),
        ),
        Container(
          child: _child(Icons.message, "CHAT", ColorD.GOLD_COLOR),
        )
      ],
    );
  }

  _child(IconData icon, String lable, Color color) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
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

 Color _getColor() {
    if(ThemeProvider.themeOf(context).id=="light"){
      return Colors.white;
    }
    else{
      return Colors.black;
    }
 }
}
