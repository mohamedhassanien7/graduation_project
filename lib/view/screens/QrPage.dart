import 'package:care_brecelet/model/RegisterScreen.dart';
import 'package:flutter/material.dart';

import '../homeScreen/patient_list.dart';
import '../widgets/qrFuncation.dart';

class QrPage extends StatelessWidget {
static const String routeName='qraa';
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context)
              .pop(PatientListView.routeName);
        },
        icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Image.asset('asset/images/scanQr.png', height: 250,),
          SizedBox(height: 100,),
          // Center( child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
          //       onPressed: (){
          //         QrCodeFunctions.scan();
          //   },
          //       child: Text("scan QR code", style: TextStyle(color: Colors.white),)),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width:265,
                height: 50,
                child: Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9177DC)),
                      onPressed: (){
                        QrCodeFunctions.scan(context,id);
                      },
                      child: Text("scan QR code", style: TextStyle(color: Colors.white, fontSize: 22),)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
