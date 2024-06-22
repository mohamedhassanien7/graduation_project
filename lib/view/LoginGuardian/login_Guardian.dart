import 'dart:ui';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/view/LoginPatient/login_patient_guardian.dart';
import 'package:care_brecelet/view/LoginGuardian/verify_code3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../widgets/customTextField.dart';

class LoginGuardian extends StatefulWidget {
  static const String routeName = 'loginGuardian';

  const LoginGuardian({super.key});

  @override
  State<LoginGuardian> createState() => _LoginGuardianState();
}

class _LoginGuardianState extends State<LoginGuardian> {
  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController phoneNumber1Controller = TextEditingController();
  final TextEditingController phoneNumber2Controller = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(login_patient_guardian.routeName);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomTextField(
                hintText: 'Home Address',
                textInputType: TextInputType.text,
                color: Colors.white,
                controller: homeAddressController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomTextField(
                controller: phoneNumber1Controller,
                hintText: 'Phone Number 1',
                textInputType: TextInputType.text,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomTextField(
                controller: phoneNumber2Controller,
                hintText: 'Phone Number 2',
                textInputType: TextInputType.text,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: TextFormField(
                      controller: dayController,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "  Day",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: TextFormField(
                      controller: monthController,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "  Month",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: TextFormField(
                      controller: yearController,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: " Year",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomTextField(
                controller: genderController,
                hintText: 'Gender',
                textInputType: TextInputType.text,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9177DC)),
                  onPressed: () async {
                    var res = await ApiManager.register(
                        args['email'],
                        args['password'],
                        args['confirmPassword'],
                        genderController.text,
                        phoneNumber1Controller.text,
                        phoneNumber2Controller.text,
                        homeAddressController.text,
                        '${yearController.text}-${monthController.text}-${dayController.text}',
                        args['firstName'],
                        args['lastName'],
                        "/guardian/signupGuardian");
                    if (res.message == "Done") {
                      var res = await ApiManager.verifyEmail(
                          args['email'], "/guardian/sendCodeEmail");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "Email Sent",
                        style: TextStyle(color: Colors.white),
                      )));
                      Navigator.of(context).pushNamed(VerifYCode3.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "Invalid Data",
                        style: TextStyle(color: Colors.white),
                      )));
                    }
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
