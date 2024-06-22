import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/models/patient_model.dart';
import 'package:care_brecelet/models/seizure_model.dart';
import 'package:care_brecelet/view/heart_rate_screen.dart';
import 'package:care_brecelet/view/history_screen.dart';
import 'package:care_brecelet/view/homeScreen/HomeScreen.dart';
import 'package:care_brecelet/view/homeScreen/patientInfo.dart';
import 'package:care_brecelet/view/motion_rate_screen.dart';
import 'package:care_brecelet/view/screens/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class PatientDetails extends StatefulWidget {
  static const String routeName = 'patientDetails';

  PatientDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  PatientModel? patientModel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      patientModel = await ApiManager.getPatientData(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as PatientSeizure;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(patientModel?.onePatientDocId?.firstName ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                    MotionRateScreen.routeName,
                    arguments:
                        patientModel?.onePatientDocId?.currentMotionRate ?? 0.0);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "asset/images/run.png",
                        width: 32,
                      ),
                      Text('Motion rate', style: TextStyle(fontSize: 25)),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                    HeartRateScreen.routeName,
                    arguments: patientModel?.onePatientDocId?.heartRate ?? 0.0);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "asset/images/heart.png",
                        width: 32,
                      ),
                      Text('Heart beat', style: TextStyle(fontSize: 25)),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MapSample.routeName);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "asset/images/location.png",
                        width: 32,
                      ),
                      Text('Location', style: TextStyle(fontSize: 25)),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                    HistoryScreen.routeName,
                    arguments: data.seizureHistory);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "asset/images/head.png",
                        width: 32,
                      ),
                      Text('seizure history', style: TextStyle(fontSize: 25)),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PatientInfo.routeName, arguments: patientModel);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "asset/images/patientInfo.png",
                          width: 32,
                        ),
                        Text(' patient information',
                            style: TextStyle(fontSize: 25)),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        gap: 6,
        onTabChange: (index) {
          print(index);
        },
        backgroundColor: Colors.deepPurple.shade200,
        tabBackgroundColor: Colors.purple.shade300,
        padding: EdgeInsets.all(20),
        tabs: [
          GButton(
            icon: Icons.person,
            text: "profile",
            iconSize: 33,
            onPressed: () {
              Navigator.pushNamed(context, ProfielsScreen.routeName);
            },
          ),
          GButton(
            icon: Icons.home,
            text: "Home",
            iconSize: 33,
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          
        ],
      ),
    );
  }
}
