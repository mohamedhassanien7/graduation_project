
import 'package:care_brecelet/Shared/Dio_Helper.dart';
import 'package:care_brecelet/view/homeScreen2/signOut/SignOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_manager/api_manager.dart';
import '../../models/patient_model.dart';
import '../homeScreen/DeleteAccount/DeleteAccountFragment.dart';
import '../homeScreen/F&Q/F&Q_Fragment.dart';
import '../homeScreen/Privacy/Privacy_Policy.dart';
import '../homeScreen/comolaints/Complaints.dart';
import '../homeScreen/patientList/Patient.dart';
import '../homeScreen/signOut/SignOut.dart';
import '../screens/generate_qrcode.dart';
import '../screens/google_maps.dart';
import 'Home2.dart';
import 'HomeDrawer2.dart';

class HomeScreen2 extends StatefulWidget {
  static const String routeName = 'Home2';
   HomeScreen2({Key? key}) : super(key: key);


  @override
  State<HomeScreen2> createState() => _HomeScreenState2();
}

class _HomeScreenState2 extends State<HomeScreen2> {

  PatientModel? patientModel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      patientModel = await ApiManager.getPatientData(context);
       {
         if (patientModel!.onePatientDocId!.heartRate! > 130 || patientModel!.onePatientDocId!.heartRate! <50 && patientModel!.onePatientDocId!.currentMotionRate!>2){
        var prefs = await SharedPreferences.getInstance();
        Position currentPosition = await MapSampleState.determineUserCurrentPosition();
        DioHelper.PostData(
            url: "patient/sendLocation",
            data: {
              "lat": currentPosition.latitude,
              "lng": currentPosition.longitude
            },
            token: "Hamada__${prefs.getString("token")}"
        ).then((value) {
          print("Sent successfully");
        }).catchError((onError){
          print(onError.toString());
        });
      }}
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1F4),
      drawer: Container(
          child: HomeDrawer2(onMenuItemClick),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: HomeDrawer2(onMenuItemClick),
        centerTitle: true,
        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white)),
        actions: [
          // InkWell(
          //
          //     child: Icon(Icons.add)),
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(GenerateScreen.routeName);
              },
              child: Icon(Icons.qr_code)),
        ],
      ),
      body: selectedWidget,
    );
  }

  Widget selectedWidget= Home2();

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.Home : {
        selectedWidget = Home2();
      }
      case MenuItem.F_Q : {
        selectedWidget = F_Q();
      }
      case MenuItem.deleteAccount : {
        selectedWidget = DeleteAccount();
      }
      case MenuItem.privacy : {
        selectedWidget = PrivacyPolicyFragment();
      }
      case MenuItem.signOut2 : {
        selectedWidget= SignOut2();
      }
      case MenuItem.complaints : {
        selectedWidget = ComplaintsFragment(role: 'patient',);

      }
    }
    setState(() {

    });
  }
}
