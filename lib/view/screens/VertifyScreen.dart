import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../myTheme/my_theme.dart';
import 'PasswordResetScreen.dart';
import 'forget_pass.dart';

class VertifyScreen extends StatefulWidget {
  static const String routeName = 'vertify';

  @override
  State<VertifyScreen> createState() => _VertifyScreenState();
}

class _VertifyScreenState extends State<VertifyScreen> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController num3 = TextEditingController();
  TextEditingController num4 = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'ForgetPwWhenLoginByPhone');

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // leading: Icon(Icons.arrow_back),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pop(ForgetPass.routeName);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)),
          SizedBox(
            height: 40,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Icon(Icons.arrow_back_ios_new_outlined),
          // ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Check your email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Text(
                'We sent a reset link to',
                style: TextStyle(fontSize: 17),
              ),
              Expanded(
                child: Text(
                  ' contact@dscode..com',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Text(
                'enter 4 digit code that mentioned in the email',
                style: TextStyle(fontSize: 17),
              )
            ],
          ),

          SizedBox(
            height: 15,
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
                        var res = await ApiManager.verifyCode(
                            num1.text + num2.text + num3.text + num4.text,
                            args ?? '');
                        if (res.message == 'Done') {
                          Navigator.of(context)
                              .pushNamed(PasswordResetScreen.routeName,
                                  arguments: args == '/patient/checkEmailCodePassword'
                                      ? '/patient/reset/newPassword'
                                      : args == '/doctor/checkEmailCodePassword'
                                          ? '/doctor/reset/newPassword'
                                          : '/guardian/reset/newPassword');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('code not valid')));
                        }
                      },
                      child: Text(
                        "Verify Code",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Haven’t got the email yet?',
                style: TextStyle(fontSize: 15),
              ),
              InkWell(
                  onTap: () {},
                  child: Text('Resend email',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF9177DC),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF9177DC)))),
            ],
          )
        ],
      ),
    );
  }
}
