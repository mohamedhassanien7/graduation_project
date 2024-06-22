import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/model/loginScreen.dart';
import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'VertifyScreen.dart';

class ForgetPass extends StatefulWidget {
  static const String routeName = 'forget';

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pop(loginScreen.routeName);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              'Forgot password',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 27,
            ),
            Expanded(
              child: Text(
                'Please enter your email to reset the password',
                maxLines: 2,
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              'Your Email',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomTextField(
            hintText: 'Enter your email',
            textInputType: TextInputType.text,
            controller: emailController,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              child: Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9177DC)),
                    onPressed: () async {
                      var res = await ApiManager.forgetPassword(
                          emailController.text, args ?? '');
                      if (res.message == 'Done') {
                        Navigator.of(context).pushNamed(VertifyScreen.routeName,
                            arguments: args == '/patient/forgetPassword'
                                ? '/patient/checkEmailCodePassword'
                                : args == '/doctor/forgetPassword'
                                    ? '/doctor/checkEmailCodePassword'
                                    : '/guardian/checkEmailCodePassword');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Email not found')));
                      }
                    },
                    child: Text(
                      "Reset password",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
