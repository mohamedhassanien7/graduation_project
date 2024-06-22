import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/view/LoginPatient/loginScreen2.dart';
import 'package:care_brecelet/view/screens/verify_code.dart';
import 'package:care_brecelet/view/LoginPatient/verify_code2.dart';
import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class login_patient_guardian extends StatefulWidget {
  static const String routeName = 'LoginPatient22';
  const login_patient_guardian({super.key});

  @override
  State<login_patient_guardian> createState() => _login_patient_guardianState();
}

class _login_patient_guardianState extends State<login_patient_guardian> {
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
            onTap: () {
              Navigator.of(context).pop(loginScreen2.routeName);
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
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               border: Border.all(
              //                 color: Colors.grey,
              //               )),
              //           child: TextFormField(
              //             obscureText: true,
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //             decoration: InputDecoration(
              //               suffixIcon: Icon(Icons.visibility_off),
              //               contentPadding: EdgeInsets.all(5),
              //               border:InputBorder.none,
              //               hintText: "Password",
              //               hintStyle: TextStyle(
              //                   color: Colors.black, fontWeight: FontWeight.w300),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // form(" Confirm Password"),
              CustomTextField(
                controller: confirmPassword,
                hintText: 'Confirm Password',
                textInputType: TextInputType.text,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(30.0),
              //       child: InkWell(
              //           onTap: () {
              //             Navigator.of(context)
              //                 .pushNamed(login_patient_guardian_rest.routeName);
              //           },
              //           child: Container(
              //             height: 80,
              //             width: 90,
              //             decoration: const BoxDecoration(
              //                 color: Color(0xFFE48F2A),
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(20))),
              //             child: const Center(
              //               child: Icon(Icons.arrow_forward, size: 40),
              //             ),
              //           )),
              //     )
              //   ],
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9177DC)),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              login_patient_guardian_rest.routeName,
                              arguments: {
                                'firstName': firstNameController.text,
                                'lastName': lastNameController.text,
                                'email': emailController.text,
                                'password': passwordController.text,
                                'confirmPassword': confirmPassword.text,
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

class form extends StatelessWidget {
  final String hintText;
  const form(this.hintText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class login_patient_guardian_rest extends StatefulWidget {
  static const String routeName = 'login3';

  const login_patient_guardian_rest({super.key});

  @override
  State<login_patient_guardian_rest> createState() =>
      _login_patient_guardian_restState();
}

class _login_patient_guardian_restState
    extends State<login_patient_guardian_rest> {
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
                controller: homeAddressController,
                hintText: 'Home Address',
                textInputType: TextInputType.text,
                color: Colors.white,
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
                        "/patient/signupPatient");
                    if (res.message == "Done") {
                      var res = await ApiManager.verifyEmail(
                          args['email'], "/patient/sendCodeEmail");
                      if (res.message == "Done") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Email Sent",
                          style: TextStyle(color: Colors.white),
                        )));
                        Navigator.of(context).pushNamed(VerifYCode2.routeName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Email Not Sent",
                          style: TextStyle(color: Colors.white),
                        )));
                      }
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
