import 'dart:io';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/myTheme/my_theme.dart';
import 'package:care_brecelet/view/screens/photo_screen.dart';
import 'package:care_brecelet/view/screens/verify_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../homeScreen/HomeScreen.dart';
import '../widgets/customTextField.dart';
import 'VertifyScreen.dart';
//import 'package:intl/intl.dart';

class FaceRecognition2 extends StatefulWidget {
  static const String routeName = 'pesonal2';

  @override
  State<FaceRecognition2> createState() => _FaceRecognition2State();
}

class _FaceRecognition2State extends State<FaceRecognition2> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(FaceRecognition.routeName);
            },
            child: Icon(Icons.arrow_back)),
      ),
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "union card",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Take a photo of the card from the \n front ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          width: 230,
          color: Colors.white,
          child: _image == null
              ? Center(
                  child: Icon(
                    Icons.linked_camera,
                    size: 40,
                    color: Colors.black,
                  ),
                )
              : FittedBox(fit: BoxFit.fill, child: Image.file(_image!)),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 44,
              width: 203,
              child: ElevatedButton.icon(
                label: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Camera     ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(
                            MyTheme.te_Co_Continue,
                          ))),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    side: BorderSide(color: Color(MyTheme.borderTextField)),
                    backgroundColor: Color(MyTheme.bGround_Button)),
                onPressed: () {
                  _pickImage(ImageSource.camera);
                  //select from camera
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 44,
              width: 203,
              child: ElevatedButton.icon(
                label: Icon(
                  Icons.terrain_rounded,
                  color: Colors.black,
                ),
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Upload File',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(
                            MyTheme.te_Co_Continue,
                          ))),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    side: BorderSide(color: Color(MyTheme.borderTextField)),
                    backgroundColor: Color(MyTheme.bGround_Button)),
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Row(children: [
          SizedBox(
            width: 58,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 44,
                width: 280,
                child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          side:
                              BorderSide(color: Color(MyTheme.borderTextField)),
                          backgroundColor: Color(MyTheme.bGround_Button)),
                      onPressed: () async {
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "Please select an image",
                            style: TextStyle(color: Colors.white),
                          )));
                          return;
                        }
                        var res = await ApiManager.registerDoctor(
                            args['email'],
                            args['password'],
                            args['phoneNumber1'],
                            args['phoneNumber2'],
                            args['address'],
                            _image!,
                            args['specialization'],
                            args['image'],
                            args['firstName'],
                            args['lastName']);
                        if (res.message == "Done") {
                          var res = await ApiManager.verifyEmail(
                              args['email'], "/doctor/sendCode/EmailConfirm");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "Email Sent",
                            style: TextStyle(color: Colors.white),
                          )));
                          Navigator.of(context).pushNamed(VerifYCode.routeName);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "Invalid Data",
                            style: TextStyle(color: Colors.white),
                          )));
                        }
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(
                              MyTheme.te_Co_Continue,
                            )),
                      )),
                ),
              ),
            ],
          )
        ]),
      ])),
    );
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      //Wait for the user to select the image (source = select image from user )
      // from gallery & camera
      if (image == null) {
        return;
      }
      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
        //error
      }
    }
  }
}
