import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NewPassScreen.dart';
import 'VertifyScreen.dart';

class PasswordResetScreen extends StatelessWidget {
  static const String routeName = 'PasswordReset';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 65,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
                onTap: (){
                  Navigator.of(context).pop(VertifyScreen.routeName);
                },
                child: Icon(Icons.arrow_back_ios_rounded)),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 25,),
              Text("Password reset", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ],
          ),
          SizedBox(height:20 ,),
          Row(children: [
            SizedBox(width: 25,),
            Expanded(
              child: Text("Your password has been successfully reset. click \n confirm to set a new password",
                maxLines: 2,
                style: TextStyle(fontSize: 16),),
            ),
          ],),
          SizedBox(height: 25,),
          
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(width: 300,
              child: Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
                    onPressed: (){
                      Navigator.of(context).pushNamed(NewPassScreen.routeName,
                      arguments: args
                      );
                    },
                    child: Text("Confirm", style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),
            )
          ],)
        ],
      ),
    );
  }
}
