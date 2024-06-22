import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/view/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class ComplaintsFragment extends StatefulWidget {
  final String role;
  const ComplaintsFragment({Key? key, required this.role}) : super(key: key);

  @override
  State<ComplaintsFragment> createState() => _ComplaintsFragmentState();
}

class _ComplaintsFragmentState extends State<ComplaintsFragment> {
  final TextEditingController complaintsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'asset/images/com.png',
              height: 200,
            )),
            SizedBox(
              height: 20,
            ),
            // CustomTextField(hintText: 'email ', textInputType: TextInputType.emailAddress, color: Color(0xFFCDC1EF),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                  controller: complaintsController,
                  hintText: 'complaints',
                  textInputType: TextInputType.text,
                  color: Color(0xFFCDC1EF),
                  maxline: 4),
            ),

            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9177DC)),
                  onPressed: () async {
                    var res = await ApiManager.setComplaint(
                        complaintsController.text,
                        widget.role == 'doctor'
                            ? '/complaint/complaintDoctor'
                            : widget.role == 'patient'
                                ? '/complaint/complaintPatient'
                                : '/complaint/complaintGuardian');
                    if (res.message == "Done") {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Success')));
                      complaintsController.clear();
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Error')));
                    }
                    setState(() {});
                  },
                  child: Text(
                    "send",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
