import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class ComplaintsFragment extends StatelessWidget {
  const ComplaintsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Center(child: Image.asset('asset/images/com.png', height: 200,)),
              SizedBox(height: 20,),
              // CustomTextField(hintText: 'email ', textInputType: TextInputType.emailAddress, color: Color(0xFFCDC1EF),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(hintText: 'complaints', textInputType: TextInputType.text, color: Color(0xFFCDC1EF),maxline: 4),
              ),

              SizedBox(height: 10,),
              SizedBox(width:300,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
                      onPressed: (){
                      },
                      child: Text("send", style: TextStyle(color: Colors.white, fontSize: 25),)),
                ),
            ],
          ),
      ),
    );
  }
}
