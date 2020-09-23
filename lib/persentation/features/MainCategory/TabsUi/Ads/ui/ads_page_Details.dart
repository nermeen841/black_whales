import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/design_utils.dart';
import 'package:black_whales/persentation/Widgets/commn_btn.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/Ads/widgets/ads_list_cell.dart';
import 'package:black_whales/persentation/features/MainCategory/TabsUi/Ads/widgets/ads_list_cell_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class AdsPageDetails extends StatefulWidget {
  final String url;
  AdsPageDetails(this.url);

  @override
  _AdsPageDetailsState createState() => _AdsPageDetailsState();
}

class _AdsPageDetailsState extends State<AdsPageDetails> {
  List<String> keys = [
    "City",
    "Neighorhood",
    "Category",
    "SubCategory",
    "Brand",
    "Model",
    "Year",
    "Condition",
    "Tranmission",
    "feul",
    "Color",
    "Bost Id"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .3,
                child: _ads_image(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .66,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          card_container(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("MARIM ELGOHRY",
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
                                              Text("15 ADS",
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 10,
                                                      color: ColorD.GOLD_COLOR
                                                  )
                                                ),
                                                 ),
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
                                  _creator_Data(),
                                ],
                              ),
                              MediaQuery.of(context).size.width * .9 , context),
                          card_container(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("mahmoudRamadan apo sailh",
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold
                                      )
                                    ),
                                      ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                 Text("06/07/2020",
                                   style: GoogleFonts.nunito(
                                     textStyle: TextStyle(
                                         color: ColorD.GOLD_COLOR,
                                         fontWeight: FontWeight.bold
                                     )
                                   ),
                                      ),
                                  ...List.generate(keys.length, (index) {
                                    return Column(
                                      children: [
                                        Divider(),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * .43,
                                              child: Text(keys[index]),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width * .43,
                                              child: Text(keys[index]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              ),
                              MediaQuery.of(context).size.width * .9 , context),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .9,
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            // height: MediaQuery.of(context).size.height * .15,
                            child: Column(children: [
                              ...List.generate(
                                3,
                                (index) => Main_text(
                                    "- Only Meet In Public Places",
                                    color: Colors.orange[500],
                                    fonthight: 1.5),
                              )
                            ]),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.orange[50],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AdsListPage(
                            lable: "mahmoud",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          card_container(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("COMMENTS",
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold
                                      )
                                    ),
                                     ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[50],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      cursorColor: Colors.white,
                                      maxLines: 4,
                                      minLines: 4,
                                      decoration: InputDecoration(
                                          hintText:
                                              "Write your Comment Here  ....",
                                          hintStyle: TextStyle(
                                              color: Colors.orange[400],
                                              fontFamily: "thin",
                                              fontSize: 12,
                                              height: 1),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 8,
                                              bottom: 11,
                                              top: 8,
                                              right: 15)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CommenButtom(
                                      function: () => print("mahmoud"),
                                      child: Text("Send"),
                                      width: 90,
                                      hight: 40,
                                    ),
                                  )
                                ],
                              ),
                              MediaQuery.of(context).size.width , context),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _creator_Data() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: _callbtn(
              "CALL", Icons.call, ColorD.GREEN_COLOR, () => print("mahmoud")),
        ),
        Container(
          child: _callbtn(
              "COMMENT", Icons.message, Colors.blue, () => print("mahmoud")),
        ),
        Container(
          child: _callbtn(
              "CHAT", Icons.call, ColorD.GOLD_COLOR, () => print("mahmoud")),
        )
      ],
    );
  }

  _child(IconData icon, String lable, Color color) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * .55 * .45,
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

  _ads_image() {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      child: Stack(
        children: [
          Swiper(
            itemBuilder: (BuildContext context, int index) {
              return cachImage(
                  this.widget.url,
                  MediaQuery.of(context).size.height * .2,
                  MediaQuery.of(context).size.width);
            },
            itemCount: 3,
            autoplay: true,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorD.BRAWN_White_COLOR,
                borderRadius: BorderRadius.circular(200)),
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(8),
            child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorD.BRAWN_White_COLOR,
                  borderRadius: BorderRadius.circular(200)),
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 6, left: 6, top: 4, bottom: 4),
              width: 65,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(R.ASSETS_ICONS_ADICON_SVG),
                  Main_text("  1/10", size: 10),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                color: ColorD.BRAWN_White_COLOR,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              margin: EdgeInsets.only(bottom: 6),
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 6, left: 6, top: 4, bottom: 4),
              width: 80,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Main_text("  150.000 RS", size: 10),
                ],
              ),
            ),
          ),
        ],
      ),
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
              SizedBox(
                width: 8,
              ),
              Main_text(lable, size: 10, fonthight: 1.5, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
