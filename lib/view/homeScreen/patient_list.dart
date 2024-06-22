import 'package:care_brecelet/Shared/Dio_Helper.dart';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/models/Get_LocaationModel.dart';
import 'package:care_brecelet/models/patients_model.dart';
import 'package:care_brecelet/models/seizure_model.dart';
import 'package:care_brecelet/view/homeScreen/patient_details.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/QrPage.dart';

class PatientListView extends StatefulWidget {
  static const String routeName = 'patientlist';
  PatientListView({Key? key}) : super(key: key);

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  String query = '';
  bool noSearch = false;
  TextEditingController? controller = TextEditingController();
  PatientsModel? patientsModel;
  SeizureModel? seizureModel;
  List<String> names = [];



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      patientsModel = await ApiManager.getPatients();
      seizureModel = await ApiManager.getHistorySeizure();
      setState(() {});
    });
    controller!.addListener(_searchResult);
  }

  void _searchResult() {
    setState(() {
      query = controller!.text;
      names.clear();
      if (query.isNotEmpty) {
        patientsModel?.patientDocId?.forEach((element) {
          if (element.firstName!.toLowerCase().contains(query.toLowerCase())) {
            names.add(element.firstName!);
          }
        });
      }
      noSearch = query.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, PatientDetails.routeName);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),

        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
          decoration: BoxDecoration(
            color: Color(0xFF9177DC).withOpacity(.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  query = value;
                  names.clear();
                  patientsModel!.patientDocId!.forEach((element) {
                    if (element.firstName!.toLowerCase().contains(query.toLowerCase())) {
                      names.add(element.firstName!);
                    }
                  });
                  if(value.isEmpty){
                    names.clear();
                  }
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Search .. ',
                hintStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.grey.withOpacity(.9),
                ),
              ),
            ),
          ),
        ),

        centerTitle: true,
      ),
      body: SafeArea(
        child: ConditionalBuilder(
          condition: names.isNotEmpty || query.isNotEmpty,
          builder: (BuildContext context) {
            return ListView.separated(
              itemCount: names.length,
              itemBuilder: (context, index) {
                int patientIndex = patientsModel!.patientDocId!.indexWhere(
                        (element) => element.firstName == names[index]);
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PatientDetails.routeName,
                      arguments: seizureModel!.patientSeizure![seizureModel!
                          .patientSeizure!
                          .indexWhere((element) =>
                      element.email ==
                          patientsModel?.patientDocId?[patientIndex].email)],
                    );
                  },
                  child: Container(
                    height: 102,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              names[index],
                              style: TextStyle(fontSize: 19),
                            ),
                            Text(
                              '1',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 25);
              },
            );
          },
          fallback: (BuildContext context) {
            return ListView.separated(
              itemCount: patientsModel?.patientDocId?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PatientDetails.routeName,
                      arguments: seizureModel!.patientSeizure![seizureModel!
                          .patientSeizure!
                          .indexWhere((element) =>
                      element.email ==
                          patientsModel?.patientDocId?[index].email)],
                    );
                  },
                  child: Container(
                    height: 102,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patientsModel?.patientDocId?[index].firstName ??
                                  '',
                              style: TextStyle(fontSize: 19),
                            ),
                            Text(
                              patientsModel?.patientDocId?[index].email ?? '',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 25);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(QrPage.routeName, arguments: 'doctor')
              .then((value) async {
            patientsModel = await ApiManager.getPatients();
            seizureModel = await ApiManager.getHistorySeizure();
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple.shade300,
      ),
    );
  }
}
