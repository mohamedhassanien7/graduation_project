
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/firebase_options.dart';
import 'package:care_brecelet/view/homeScreen3/signOut/SignOut.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../homeScreen/DeleteAccount/DeleteAccountFragment.dart';
import '../homeScreen/F&Q/F&Q_Fragment.dart';
import '../homeScreen/Privacy/Privacy_Policy.dart';
import '../homeScreen/comolaints/Complaints.dart';
import '../homeScreen/patientList/Patient.dart';
import '../homeScreen/signOut/SignOut.dart';
import '../screens/generate_qrcode.dart';
import 'Home3.dart';
import 'HomeDrawer3.dart';

class HomeScreen3 extends StatefulWidget {
  static const String routeName = 'Home3';
   HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreenState3();
}

class _HomeScreenState3 extends State<HomeScreen3> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AwesomeNotifications().initialize(
          null,
          [
            NotificationChannel(
                channelGroupKey: 'basic_channel_group',
                channelKey: 'basic_channel',
                channelName: 'Basic notifications',
                channelDescription: 'Notification channel for basic tests',
                defaultColor: Color(0xFF9D50DD),
                locked: true,
                soundSource: 'resource://raw/alarm',
                enableVibration: true,
                criticalAlerts: true,
                playSound: true,
                ledColor: Colors.white)
          ],
          channelGroups: [
            NotificationChannelGroup(
                channelGroupKey: 'basic_channel_group',
                channelGroupName: 'Basic group')
          ],
          debug: true);
      await AwesomeNotifications().requestPermissionToSendNotifications();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );
      await AwesomeNotifications().setChannel(NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
      ));
      await AwesomeNotifications().requestPermissionToSendNotifications();
      await ApiManager.saveToken('guardian', await messaging.getToken() ?? '');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(message.notification?.title);
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            displayOnBackground: false,
            id: 1,
            channelKey: 'basic_channel',
            title: message.notification?.title,
            body: message.notification?.body,
            criticalAlert: true,
          ),
        );
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1F4),
      drawer: Container(
          child: HomeDrawer3(onMenuItemClick),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: HomeDrawer2(onMenuItemClick),
        centerTitle: true,
        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white)),

      ),
      body: selectedWidget,
    );
  }

  Widget selectedWidget= Home3();

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.Home : {
        selectedWidget = Home3();
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
      case MenuItem.signOut3 : {
        selectedWidget= SignOut3();
      }
      case MenuItem.complaints : {
        selectedWidget = ComplaintsFragment(role: 'guardian',);

      }
    }
    setState(() {

    });
  }
}
