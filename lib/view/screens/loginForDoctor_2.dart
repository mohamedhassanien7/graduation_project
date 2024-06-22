import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class LoginForDoctor_2 extends StatelessWidget {
  static String routeName = 'login';
  const LoginForDoctor_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 35,),
            CustomTextField(hintText: 'Clinic address', textInputType: TextInputType.text,),
            CustomTextField(hintText: 'Specialization', textInputType: TextInputType.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Text('certificate', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),


            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
                onPressed: (){
                },
                child: Text("Choose a picture", style: TextStyle(color: Colors.white),)),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
                        onPressed: (){
                        },
                        child: Text("Next", style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
