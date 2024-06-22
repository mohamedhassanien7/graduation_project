import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../screens/profile_screen.dart';
import '../../screens/search_screen.dart';
import '../HomeScreen.dart';
import '../patient_list.dart';

class Patient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1f4),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30,),
        GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PatientListView.routeName,);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withOpacity(.5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Patient List', style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_forward_outlined)
                    ],
                  ),
                ),
              ),
            )
        ],
      ),

      bottomNavigationBar: GNav(
        selectedIndex: 1,
        gap: 6,
        onTabChange: (index){
          print(index);
        },
        backgroundColor: Colors.deepPurple.shade200,
        tabBackgroundColor: Colors.purple.shade300,
        padding: EdgeInsets.all(20),
        tabs: [
          GButton(icon: Icons.person,
            text: "profile",
            iconSize: 33,
            onPressed: (){
              Navigator.pushNamed(context,
                  ProfielsScreen.routeName,
                  arguments: 'doctor'
                  );
            },
          ),
          GButton(icon: Icons.home,
            text: "Home",
            iconSize: 33,
            onPressed: (){

            },
          ),

        ],
      ),
    );
  }
}

