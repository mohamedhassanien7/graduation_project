import 'package:care_brecelet/model/RegisterScreen.dart';
import 'package:care_brecelet/model/loginScreen.dart';
import 'package:care_brecelet/view/screens/photo_screen.dart';
import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class LoginDoctor extends StatefulWidget {
  static const String routeName = 'login';
  const LoginDoctor({super.key});

  @override
  State<LoginDoctor> createState() => _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumber1Controller = TextEditingController();
  final TextEditingController phoneNumber2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back_outlined),
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
                  child: Icon(Icons.arrow_back)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Basic Data",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                hintText: 'First Name',
                textInputType: TextInputType.name,
                color: Colors.white,
                controller: firstNameController,
              ),
              CustomTextField(
                hintText: 'Last Name',
                textInputType: TextInputType.name,
                color: Colors.white,
                controller: lastNameController,
              ),
              CustomTextField(
                hintText: 'Email',
                textInputType: TextInputType.text,
                color: Colors.white,
                controller: emailController,
              ),
              CustomTextField(
                hintText: 'password',
                textInputType: TextInputType.text,
                isObscured: true,
                color: Colors.white,
                controller: passwordController,
              ),
              CustomTextField(
                hintText: 'Phone number1',
                textInputType: TextInputType.number,
                color: Colors.white,
                controller: phoneNumber1Controller,
              ),
              CustomTextField(
                hintText: 'Phone number2',
                textInputType: TextInputType.number,
                color: Colors.white,
                controller: phoneNumber2Controller,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9177DC)),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(FaceRecognition.routeName, arguments: {
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                            'phoneNumber1': phoneNumber1Controller.text,
                            'phoneNumber2': phoneNumber2Controller.text,
                          });
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
