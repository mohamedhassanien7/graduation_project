import 'package:barcode_widget/barcode_widget.dart';
import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/models/doctor_auth_model.dart';
import 'package:care_brecelet/view/homeScreen3/HomeScreen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeFunctions {
  static DoctorAuthModel? res;
  //scan Qr
  static void scan(BuildContext context, String id) async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
          '#2A99CF', 'Cancel', true, ScanMode.QR);
      if (id == 'guardian') {
        res = await ApiManager.scanQrGurdian(code);
      } else {
        res = await ApiManager.scanQrDoctor(code);
      }
      if (res?.message == 'Done') {
         if (id == 'guardian') {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen3.routeName, (route) => false);
      } else {
        Navigator.of(context).pop();
      }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Success', style: TextStyle(color: Colors.white))));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Invalid Qr Code',
                style: TextStyle(color: Colors.white))));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString(), style: TextStyle(color: Colors.white))));
    }
  }

  //write  Qr Code
  static Widget showCode() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BarcodeWidget(
          color: Colors.black,
          barcode: Barcode.qrCode(), // Barcode type and settings
          data: '1234567',
        )
      ],
    );
  }
}
