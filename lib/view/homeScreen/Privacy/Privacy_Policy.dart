import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyFragment extends StatelessWidget {
  static const String routeName='privacy';
  const PrivacyPolicyFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: Icon(CupertinoIcons.e),
      //   title:  Text('Privacy Policy'),
      // ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Privacy Policy', style: TextStyle(color: Colors.black, fontSize: 24),)),
            SizedBox(height: 9,),
            Text('Cancelation Policy',style: TextStyle(color: Color(0xFFB109B5), fontSize: 20),),
            SizedBox(height: 5,),
            Text('Effective Data :  [ Date ]',style: TextStyle(color: Color(0xFF858585), fontSize: 18),),

            Text('overview : this cancelation policy out lines the \n procedures and conditions related to the \n cancellation of appointments on our \n telemedicine app . using our services you \n agree to abide by the terms and conditions \n outlined in this policy',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 7,),
            Text('for any questions or concerns regarding this \n policy. Please contact our customer support \n team.',style: TextStyle(color: Colors.black, fontSize: 18),),
            SizedBox(height: 4,),
            Text('Terms & Condition',style: TextStyle(color: Color(0xFFB109B5), fontSize: 20),),
            SizedBox(height: 5,),
            Text('Effective Data :  [ Date ]',style: TextStyle(color: Color(0xFF858585), fontSize: 18),),
            Text('1. Acceptance of terms : By accessing or using \n Care Bracelet app , you agree to comply with \n and be bound not agree with any part of these \n terms , you may not use our services .',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 7,),
            Text('2. Eligibility : you must be at lasted 18 years \n old and have the legal capacity to enter into \n a contract to use our service, you represent \n and warrant that you meet these eligibility \n requirements .  ',style: TextStyle(color: Colors.black, fontSize: 18),),
            // Row(
            //   children: [
            //     Spacer(),
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
            //         onPressed: (){
            //         },
            //         child: Text("Accept", style: TextStyle(color: Colors.white, fontSize: 20),)),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
