import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/view/screens/PasswordResetScreen.dart';
import 'package:care_brecelet/view/screens/doneScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/customTextField.dart';

class NewPassScreen extends StatelessWidget {
  static const String routeName = 'NewPass';

  final TextEditingController pass = TextEditingController();
  final TextEditingController repass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(PasswordResetScreen.routeName);
                  },
                  child: Icon(Icons.arrow_back_ios_rounded)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 35,
                ),
                Text(
                  'Set a new password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 29,
                ),
                Expanded(
                  child: Text(
                    'Create a new password. Ensure it differs from \n previous ones for security',
                    maxLines: 2,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextField(
                  controller: pass,
                  hintText: 'Enter your new password',
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextField(
                  controller: repass,
                  hintText: 'Re-enter password',
                  textInputType: TextInputType.text),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9177DC)),
                        onPressed: () async {
                          var res = await ApiManager.resetPassword(
                              pass.text, repass.text, args ?? '');
                          if (res.message == 'Done reset') {
                            Navigator.of(context).pushNamed(
                              doneScreen.routeName,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Password not valid')));
                          }
                        },
                        child: Text(
                          "update password",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
