import 'dart:math';

import 'package:care_brecelet/Shared/Dio_Helper.dart';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/models/doctor_auth_model.dart';
import 'package:care_brecelet/view/homeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/screens/LoginDoctor.dart';
import '../view/screens/forget_pass.dart';
import 'RegisterScreen.dart';

class loginScreen extends StatefulWidget {
  static const String routeName = 'loginDoctor';
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DoctorAuthModel? doctorAuthModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Icon(Icons.arrow_back)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset('asset/images/doctorr.png', height: 170),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFF9177DC)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Image.asset(
                        "asset/images/Frame.png",
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Image.asset(
                        "asset/images/Frame2.png",
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: TextFormField(
                        controller: passwordController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.visibility_off),
                          border: InputBorder.none,
                          hintText: "  Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 0),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ForgetPass.routeName,
                            arguments: "/doctor/forgetPassword");
                      },
                      child: Text(
                        "forget password?",
                        style: TextStyle(color: Color(0xFF9177DC)),
                      )),
                )
              ],
            ),
            const SizedBox(height: 17),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9177DC)),
                  onPressed: () async {
                    // var docRes = await ApiManager.login(emailController.text,
                    //     passwordController.text, "/doctor/loginDoctor").then((value) => null).
                    // catchError((onError){
                    //   print(onError.toString());
                    // });
                    DioHelper.PostData(
                      url: "doctor/loginDoctor",
                      data: {
                        'email':emailController.text,
                        'password' : passwordController.text
                      }
                    ).then((value) async {
                      doctorAuthModel =DoctorAuthModel.fromJson(value.data);

                      if (doctorAuthModel!.message == "Done") {
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setString('id', doctorAuthModel!.doctorIdToken?.id ?? '');
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      } else if (doctorAuthModel!.message == "Please accept from admin.") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please accept from admin.",
                                style: TextStyle(color: Colors.white))));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Invalid Email or Password",
                                style: TextStyle(color: Colors.white))));
                      }
                    }).catchError((onError){
                      print(onError.toString());
                    });

                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'OR',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginDoctor.routeName);
                },
                child: Text(
                  'Don’t have an Account? sign up',
                  style: TextStyle(color: Color(0xFF9177DC)),
                ))
          ],
        ),
      ),
    );
  }
}
