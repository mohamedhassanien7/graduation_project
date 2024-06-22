import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/myTheme/my_theme.dart';
import 'package:care_brecelet/view/homeScreen/HomeScreen.dart';
import 'package:care_brecelet/view/homeScreen2/HomeScreen2.dart';
import 'package:care_brecelet/view/screens/photo2_screen.dart';
import 'package:flutter/material.dart';
import 'package:care_brecelet/view/LoginPatient/loginScreen2.dart';

class VerifYCode2 extends StatefulWidget {
  static const String routeName = 'verify2';

  @override
  State<VerifYCode2> createState() => _VerifYCodeState();
}

class _VerifYCodeState extends State<VerifYCode2> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController num3 = TextEditingController();
  TextEditingController num4 = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'ForgetPwWhenLoginByPhone');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(FaceRecognition2.routeName);
            },
            child: Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/verify.png'),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'verify your email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'please enter the 4 digit code sent to \n yourmail@example.com ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: 53,
                          child: TextField(
                            controller: num1,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            cursorColor: Color(MyTheme.textverifiCode),
                            cursorHeight: 22,
                            cursorWidth: 1,
                            textAlignVertical: TextAlignVertical.center,
                            enableSuggestions: true,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(MyTheme.backgroundInterface),
                              filled: true,
                              hintStyle:
                                  TextStyle(color: Color(MyTheme.textRegister)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: 53,
                          child: TextField(
                            controller: num2,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            cursorColor: Color(MyTheme.textverifiCode),
                            cursorHeight: 22,
                            cursorWidth: 1,
                            textAlignVertical: TextAlignVertical.center,
                            enableSuggestions: true,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(MyTheme.backgroundInterface),
                              filled: true,
                              hintStyle:
                                  TextStyle(color: Color(MyTheme.textRegister)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: 53,
                          child: TextField(
                            controller: num3,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            cursorColor: Color(MyTheme.textverifiCode),
                            cursorHeight: 22,
                            cursorWidth: 1,
                            textAlignVertical: TextAlignVertical.center,
                            enableSuggestions: true,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(MyTheme.backgroundInterface),
                              filled: true,
                              hintStyle:
                                  TextStyle(color: Color(MyTheme.textRegister)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: 53,
                          child: TextField(
                            controller: num4,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                // if (value.isEmpty) {
                                // return 'Please enter your username';
                                // }
                                // return null;
                              }
                            },
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            cursorColor: Color(MyTheme.textverifiCode),
                            cursorHeight: 22,
                            cursorWidth: 1,
                            textAlignVertical: TextAlignVertical.center,
                            enableSuggestions: true,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(MyTheme.backgroundInterface),
                              filled: true,
                              hintStyle:
                                  TextStyle(color: Color(MyTheme.textRegister)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Center(
                child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Resend code',
                      style: TextStyle(fontSize: 20, color: Color(0xFF9177DC)),
                    ))),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9177DC)),
                        onPressed: () async {
                          var res = await ApiManager.confirmEmail(
                              num1.text + num2.text + num3.text + num4.text,
                              '/patient/confirmEmailPatient');
                          if (res.message == "Done") {
                            Navigator.of(context)
                                .pushNamed(loginScreen2.routeName);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Error in confirming email",
                                  style: TextStyle(color: Colors.white)),
                            ));
                          }
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
