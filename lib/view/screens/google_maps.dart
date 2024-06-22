import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class MapSample extends StatefulWidget{
  static const String routeName='maps';


  @override
  MapSampleState createState() => MapSampleState();

}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;
  late LatLng defaultLatLng;
  late LatLng draggedLatlng;
  String draggedAddress = "";

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init(){
    defaultLatLng = LatLng(11, 114);
    draggedLatlng = defaultLatLng;
    cameraPosition = CameraPosition(
        target: defaultLatLng,
        zoom: 17.5
    );
    gotoUserCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          gotoUserCurrentPosition();
        },
        child: Icon(Icons.location_on),
      ),
    );
  }
  Widget buildBody(){
    return Stack(
      children: [
        getMap(),
        getCustomPin(),
        showDraggedAddress()
      ],
    );
  }

  Widget showDraggedAddress(){
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blue
        ),
        child: Center(child: Text(draggedAddress,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
      ),
    );
  }

  Widget getMap(){
    return GoogleMap(
      initialCameraPosition: cameraPosition!,
      mapType: MapType.normal,
      onCameraIdle: (){
        getAddress(defaultLatLng);
      },
      onCameraMove: (cameraPosition){
        defaultLatLng = cameraPosition.target;
      },
      onMapCreated: (GoogleMapController controller){
        if(!googleMapController.isCompleted){
          googleMapController.complete(controller);
        }
      },
    );
  }

  Widget getCustomPin(){
    return Center(
      child: Container(
        width: 200,
        child: Lottie.asset("asset/piiin.json"),
      ),
    );
  }

  Future getAddress(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude,position.longitude);
    Placemark address = placemarks[0];
    String adresStr= "${address.street},${address.locality}, ${address.administrativeArea},${address.country}";
    setState(() {
      draggedAddress = adresStr;
    });
  }

  Future<Position> gotoUserCurrentPosition() async{
    Position currentPosition = await determineUserCurrentPosition();
    gotoSpecificPosition(LatLng(currentPosition.latitude, currentPosition.longitude));
    return currentPosition;
  }

  Future gotoSpecificPosition(LatLng position) async{
    GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: position,
            zoom: 17.5
        )
    ));
    await getAddress(position);
  }

  static Future<Position> determineUserCurrentPosition() async{
    LocationPermission locationPermission;
    bool isLocationServiceEnabled =await Geolocator.isLocationServiceEnabled();
    if(!isLocationServiceEnabled){
      print("user don't enable location permission");
    }
    locationPermission = await Geolocator.checkPermission();

    if(locationPermission== LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        print("user denied location permission");
      }
    }
    if(locationPermission ==LocationPermission.deniedForever){
      print("user denied permission forever");
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }


}

