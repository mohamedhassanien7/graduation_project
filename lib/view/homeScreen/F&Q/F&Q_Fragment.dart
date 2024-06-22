import 'package:flutter/material.dart';

class F_Q extends StatelessWidget {
  const F_Q({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Image.asset('asset/images/faq.png', height: 200,)),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              child: Text('How is the bracelet connected to the \n application ?',style: TextStyle(fontSize: 20),),
              padding: EdgeInsets.all(15),
              decoration:BoxDecoration(
                  color: Color(0xFFCDC1EF),
                  borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              child: Text('How the guardian communicates with \n the patient?',style: TextStyle(fontSize: 20),),
              padding: EdgeInsets.all(10),
              decoration:BoxDecoration(
                color: Color(0xFFCDC1EF),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              child: Text('How do I play the bracelet ?',style: TextStyle(fontSize: 20),),
              padding: EdgeInsets.all(27),
              decoration:BoxDecoration(
                color: Color(0xFFCDC1EF),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
