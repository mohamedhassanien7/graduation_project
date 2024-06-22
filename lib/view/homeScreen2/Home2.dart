import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class Home2 extends StatelessWidget {
  static const String routeName ='home2';
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1f4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset("asset/images/head.png", width: 270,))
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
                  arguments: 'patient'
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
