import 'package:care_brecelet/models/seizure_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = 'hostory';

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as List<SeizureHistory>?;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.green,
          title: const Text('seizure history',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      'there was a seizure',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                        DateFormat('yyyy-MM-dd – kk:mm')
                            .format(data![index].time ?? DateTime.now()),
                        style: TextStyle(color: Colors.black)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
