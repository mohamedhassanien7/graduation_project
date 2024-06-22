import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/view/homeScreen/DeleteAccount/DeleteAccountFragment.dart';
import 'package:care_brecelet/view/homeScreen/F&Q/F&Q_Fragment.dart';
import 'package:care_brecelet/view/homeScreen/Privacy/Privacy_Policy.dart';
import 'package:care_brecelet/view/homeScreen/comolaints/Complaints.dart';
import 'package:care_brecelet/view/homeScreen/patientList/Patient.dart';
import 'package:care_brecelet/view/homeScreen/signOut/SignOut.dart';
import 'package:care_brecelet/view/screens/google_maps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Shared/Dio_Helper.dart';
import '../../firebase_options.dart';
import '../../models/Get_LocaationModel.dart';
import 'HomeDrawer.dart';
import 'package:geolocator/geolocator.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GetLocation? getLocation;
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
      await ApiManager.saveToken('doctor', await messaging.getToken() ?? '');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
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
        var prefs = await SharedPreferences.getInstance();
        DioHelper.GetData(
            url: "doctor/getLocation/${prefs.getString("pIdToken")}",
            token: "Hamada__${prefs.getString("token")}"
        ).then((value) {
          getLocation = GetLocation.fromJson(value.data);
          print(getLocation!.location!.lat);
          print(getLocation!.location!.lon);

        }).catchError((onError){
          print(onError.toString());
        });

        ///////////here////////////
      });
      });
      // var email = ModalRoute.of(context)?.settings.arguments as MapSample;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1F4),
      // backgroundColor: Colors.white,
      drawer: HomeDrawer(onMenuItemClick),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: selectedWidget,

      // Column(
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.pushNamed(context, PatientListView.routeName,);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: 24),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(16),
      //           color: Colors.grey.withOpacity(.5)
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Pationt List'),
      //               Icon(Icons.arrow_forward_outlined)
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget selectedWidget = Patient();

  void onMenuItemClick(MenuItem item) {
    Navigator.pop(context);
    switch (item) {
      case MenuItem.patient:
        {
          selectedWidget = Patient();
        }
      case MenuItem.F_Q:
        {
          selectedWidget = F_Q();
        }
      case MenuItem.deleteAccount:
        {
          selectedWidget = DeleteAccount();
        }
      case MenuItem.privacy:
        {
          selectedWidget = PrivacyPolicyFragment();
        }
      case MenuItem.signOut:
        {
          selectedWidget = SignOut();
        }
      case MenuItem.complaints:
        {
          selectedWidget = ComplaintsFragment(
            role: 'doctor',
          );
        }
    }
    setState(() {});
  }
}
