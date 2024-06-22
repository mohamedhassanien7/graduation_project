import 'package:care_brecelet/view/screens/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class Home3 extends StatelessWidget {
  static const String routeName ='home3';
  const Home3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1f4),
      body: Column(
      children: [
        SizedBox(height: 40,),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(MapSample.routeName);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepPurple.shade200
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("asset/images/location.png",width: 32,),
                  Text('Location', style: TextStyle(fontSize: 25)),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepPurple.shade200
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("asset/images/alarm.png",width: 32,),
                  Text('Alarm', style: TextStyle(fontSize: 25)),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        ),
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
                  arguments: 'guardian'
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
