import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/view/homeScreen/HomeScreen.dart';
import 'package:care_brecelet/view/homeScreen2/HomeScreen2.dart';
import 'package:care_brecelet/view/homeScreen3/HomeScreen3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/RegisterScreen.dart';
import '../screens/LoginDoctor.dart';
import '../screens/forget_pass.dart';
import 'package:care_brecelet/view/LoginPatient/login_patient_guardian.dart';

class loginScreen2 extends StatefulWidget {
  static const String routeName = 'loginSC22';
  const loginScreen2({super.key});

  @override
  State<loginScreen2> createState() => _loginScreen2State();
}

class _loginScreen2State extends State<loginScreen2> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var PatRes;

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
            Image.asset('asset/images/patient.png', height: 170),
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
                Positioned(
                    left: 10,
                    child: Container(
                      width: 275,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ForgetPass.routeName,
                          arguments: "/patient/forgetPassword");
                    },
                    child: Text(
                      "forget password?",
                      style: TextStyle(color: Color(0xFF9177DC)),
                    ))
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
                     PatRes = await ApiManager.login(emailController.text,
                        passwordController.text, "/patient/loginPatient");
                    if (PatRes.message == "Done") {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString("pIdToken", PatRes.doctorIdToken.id);
                      prefs.setString('id', PatRes.doctorIdToken?.id ?? '');
                      Navigator.of(context).pushNamed(HomeScreen2.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Invalid Email or Password",
                              style: TextStyle(color: Colors.white))));
                    }
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
                  Navigator.of(context)
                      .pushNamed(login_patient_guardian.routeName);
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
