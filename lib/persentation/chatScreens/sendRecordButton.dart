import 'package:black_whales/persentation/CameraScreens/cameraScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:fitted_text_field_container/fitted_text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

import 'audioRecorder.dart';
import 'managerGlobal.dart';



class SendRecordButton extends StatefulWidget {
  @override
  _SendRecordButtonState createState() => _SendRecordButtonState();
}

class _SendRecordButtonState extends State<SendRecordButton> {



  final Random rand = Random(DateTime.now().millisecondsSinceEpoch);
  TextEditingController textEditingCtl;
  FocusNode _plainFocusNode;
  FocusNode _poundFocusNode;


  @override
  void initState() {
    super.initState();
    textEditingCtl = TextEditingController();
    _plainFocusNode = FocusNode();
    _poundFocusNode = FocusNode();
    Timer(Duration(milliseconds: 2000), () {
      // Uncomment this for automatic text input
      // runInputer(20);
    });

  }



  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 10 , right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
              border: Border.all( color: _changeColor() )
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.sentiment_very_satisfied,),
                      onPressed: () {}),
                  Expanded(
                    child: FittedTextFieldContainer(
                      calculator: (m) => m.fixedWidths + max(m.labelWidth, max(m.hintWidth, m.textWidth)),
                      child: TextField(
                        controller: textEditingCtl,
                        style: TextStyle(fontSize: 16),
                        focusNode: _plainFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        maxLines: null,
                        onSubmitted: (String value) {
                          FocusScope.of(context).requestFocus(_poundFocusNode);


                        },
                        decoration: InputDecoration(
                          hintText: "Send A new Message",
                          hintStyle: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700
                              )
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: _onChanged,


                      ),

                    ),


                  ),

                  InkWell(
                    child: Icon(Icons.photo_camera),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(seconds: 1),
                              child: CameraScreen()
                          ));
                    },
                  ),

                  SizedBox( width: 5,),

                  Padding(
                    padding: EdgeInsets.only( right : 5),
                    child: InkWell(
                      child: Icon(Icons.attach_file , size: 20,),
                      onTap: () {
                        displayModalBottomSheet(context);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),

          SizedBox(
            width: 5,
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: myGreen, shape: BoxShape.circle),
            child: InkWell(
              child: _iconChange(),
              onLongPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioRecorder()));
              },

            ),),


        ],
      ),
    );




  }




  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }


  Widget _iconChange(){

    if( charLength >= 1){
      return Icon(Icons.send , color: Colors.white,);
    }
    else{
      return Icon(Icons.keyboard_voice , color: Colors.white,);
    }
  }

  void displayModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library, color: Colors.green,),
                    title: Text('Gallary'),
                    onTap: () {
                      openGallery();
                    }),
                ListTile(
                  leading: Icon(Icons.folder, color: Colors.purpleAccent,),
                  title: Text('Document'),
                  onTap: () {
                    openFile();
                  },
                ),
              ],
            ),
          );
        });
  }


  Color _changeColor(){
    if( ThemeProvider.themeOf(context).id=="light"){
      return Colors.black;
    }

    else{
      return Colors.white;
    }
  }

  void openFile() async {
    List<File> files = await FilePicker.getMultiFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'txt'],
    );
  }


  void openGallery() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }




}
