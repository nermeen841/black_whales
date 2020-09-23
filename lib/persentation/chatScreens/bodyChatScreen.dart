
import 'package:black_whales/const/resource.dart';
import 'package:black_whales/core/color.dart';
import 'package:black_whales/persentation/chatScreens/sendRecordButton.dart';
import 'package:black_whales/persentation/chatScreens/sentMessageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';
import 'managerGlobal.dart';
import 'myCircularAvatar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'myRecievedMessage.dart';


class ChatScreen extends StatelessWidget {

  TextEditingController textEditingCtl = TextEditingController();
final assetname = R.ASSETS_ICONS_BACKICON_SVG;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset( assetname , color: _changeColor(context), width: 20, height: 15,),
            SizedBox(
              width: 5,
            ),
            MyCircleAvatar(
              imgUrl: friendsList[0]['imgUrl'],
            ),
            SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "MARIM ELGOHERY",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        color: _changeColor(context)
                      )
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(R.ASSETS_ICONS_ONLINEICON_SVG, width: 7, height: 7,),
                        SizedBox( width: 5),
                        Text(
                          "Online",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: HexColor('#BD884A'),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),

                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        SvgPicture.asset( R.ASSETS_ICONS_ONLINEICON_SVG, width: 7, height: 7),
                        SizedBox( width: 5),
                        Row(
                          children: [
                            Text(
                              "Response Time",
                              style:  GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor('#BD884A'),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),

                              ),
                            ),
                            Text(
                              "Less Than A Day",
                              style:  GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.phone , color: _changeColor(context), ),
            onTap: () => launch("tel://21213123123"),
          ),
          SizedBox(
            width: 5,
          ),

          InkWell(
            child: Icon(Icons.more_vert , color: _changeColor(context),),
            onTap: () {},
          ),
        ],
      ),
      body:  Stack(
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only( top: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width:  MediaQuery.of(context).size.width *.9,
                    height: 115,
                    decoration: BoxDecoration(
                      color: HexColor('#F1E8D5'),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),),
                    child: Column(
                      children: [
                        Text('- General Tips' ,
                          style: GoogleFonts.nunito(
                              color: HexColor('#966E39'),
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ) ,
                        ),
                        SizedBox(height: 5,),
                        Text('- only meet in public places ' ,
                          style: GoogleFonts.nunito(
                            color: HexColor('#BD884A'),
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),

                        ),
                        SizedBox(height: 5,),
                        Text('- never pay or transfer money in advance ' ,
                          style: GoogleFonts.nunito(
                            color: HexColor('#BD884A'),
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),

                        ),
                        SizedBox(height: 5,),
                        Text(' - inspect the product before you buy it' ,
                          style: GoogleFonts.nunito(
                            color: HexColor('#BD884A'),
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),

                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: messages.length,
                      itemBuilder: (ctx, i) {

                        if (messages[i]['status'] == MessageType.received) {
                          return ReceivedMessagesWidget(i: i);
                        } else {
                          return SentMessageWidget(i: i);
                        }
                      },
                    ),

                  ),
                  SendRecordButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _changeColor( BuildContext context){
    if( ThemeProvider.themeOf(context).id=="light"){
      return Colors.black;
    }

    else{
      return Colors.white;
    }
  }
}







