import 'package:care_brecelet/view/LoginGuardian/loginScreen3.dart';
import 'package:care_brecelet/view/screens/verify_code.dart';
import 'package:care_brecelet/view/LoginPatient/verify_code2.dart';
import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/material.dart';

import 'login_Guardian.dart';

class loginGard extends StatefulWidget {
  static const String routeName = 'Logingard';
  const loginGard({super.key});

  @override
  State<loginGard> createState() => _loginGardState();
}

class _loginGardState extends State<loginGard> {
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop(loginScreen3.routeName);
            },
            child: Icon(Icons.arrow_back_outlined)),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Basic Data",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ],
                ),
              ),

              CustomTextField(hintText: 'First Name', textInputType: TextInputType.name , color: Colors.white,controller: firstNameController,),
              CustomTextField(hintText: 'Last Name', textInputType: TextInputType.name, color: Colors.white,controller: lastNameController,),
              CustomTextField(hintText:'Email', textInputType: TextInputType.text, color: Colors.white,controller: emailController,),
              CustomTextField(hintText:'password', textInputType: TextInputType.text,isObscured: true , color: Colors.white,controller: passwordController,),
              CustomTextField(hintText: 'Confirm Password', textInputType: TextInputType.text, color: Colors.white,controller: confirmPassword,),
              SizedBox(
                height: 10,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*.7,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
                        onPressed: (){
                          Navigator.of(context).pushNamed(LoginGuardian.routeName,
                          arguments: {
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                            'confirmPassword': confirmPassword.text,
                          }
                          );
                        },
                        child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 20),)),
                  )
                ],)

            ],
          ),
        ),
      ),
    );
  }
}