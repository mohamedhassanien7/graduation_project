// import 'package:care_bracelet/login_patient_guardian.dart';
// import 'package:care_bracelet/model/loginScreen.dart';
import 'package:care_brecelet/view/screens/QrPage.dart';
import 'package:care_brecelet/view/screens/generate_qrcode.dart';
import 'package:care_brecelet/view/LoginPatient/loginScreen2.dart';
import 'package:care_brecelet/view/LoginGuardian/loginScreen3.dart';
import 'package:flutter/material.dart';
import 'package:care_brecelet/view/LoginPatient/login_patient_guardian.dart';
import 'package:care_brecelet/model/loginScreen.dart';

import '../view/screens/LoginDoctor.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register' ;
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Image.asset("asset/images/Rectangle 19.png" , width: 300,
                      height: 300, fit: BoxFit.fill,),
                    Image.asset("asset/images/Rectangle 27.png", width: 250,
                      height: 250,fit: BoxFit.fill,),
                    Image.asset("asset/images/Rectangle 28.png" , width: 200,
                      height: 200,fit: BoxFit.fill,),
                  ],
                ),
              ],
            ),
             Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width-60,
                          decoration: BoxDecoration(
                              color: Color(0xFFBAA9E9),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 25,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushNamed(loginScreen.routeName);
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width-100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF9177DC),
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Doctor" , style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                                              SizedBox(width: 60,),
                                              Image.asset("asset/images/download 1.png" ,height: 50 , width: 50,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushNamed(loginScreen2.routeName);
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width-100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF9177DC),
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Patient" , style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                                              SizedBox(width: 60,),
                                              Image.asset("asset/images/images 1.png" ,height: 40 , width: 40,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushNamed(loginScreen3.routeName);
                                      },
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width-100,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF9177DC),
                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Guardian" , style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                                              SizedBox(width: 60,),
                                              Image.asset("asset/images/4757203-200 1.png" ,height: 50 , width: 50,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height:50,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
