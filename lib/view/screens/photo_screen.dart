import 'dart:io';
import 'package:care_brecelet/myTheme/my_theme.dart';
import 'package:care_brecelet/view/screens/photo2_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/customTextField.dart';
import 'LoginDoctor.dart';
//import 'package:intl/intl.dart';

class FaceRecognition extends StatefulWidget {
  static const String routeName = 'pesonal';

  @override
  State<FaceRecognition> createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  File? _image;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(LoginDoctor.routeName);
              },
              child: Icon(Icons.arrow_back)),
        ),
        backgroundColor: Color(MyTheme.backgroundGeneral),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                CustomTextField(
                  controller: addressController,
                  hintText: 'Clinic address',
                  textInputType: TextInputType.text,
                  color: Colors.white,
                ),
                CustomTextField(
                  controller: specializationController,
                  hintText: 'Specialization',
                  textInputType: TextInputType.text,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'certificate',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
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
                            side: BorderSide(
                                color: Color(MyTheme.borderTextField)),
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
                            side: BorderSide(
                                color: Color(MyTheme.borderTextField)),
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
                                  side: BorderSide(
                                      color: Color(MyTheme.borderTextField)),
                                  backgroundColor:
                                      Color(MyTheme.bGround_Button)),
                              onPressed: () {
                                if (_image == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Please select an image",
                                    style: TextStyle(color: Colors.white),
                                  )));
                                  return;
                                }
                                Navigator.of(context).pushNamed(
                                    FaceRecognition2.routeName,
                                    arguments: {
                                      'firstName': args?['firstName'],
                                      'lastName': args?['lastName'],
                                      'email': args?['email'],
                                      'password': args?['password'],
                                      'phoneNumber1': args?['phoneNumber1'],
                                      'phoneNumber2': args?['phoneNumber2'],
                                      'address': addressController.text,
                                      'specialization':
                                          specializationController.text,
                                      'image': _image,
                                    });
                              },
                              child: Text(
                                'Next',
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
        ));
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

//
//   void pickImage() async{
//     var image=await ImagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image=_image;
//     });
//   }
// }
//
