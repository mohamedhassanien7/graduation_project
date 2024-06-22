import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../homeScreen/patient_details.dart';
import '../widgets/customTextField.dart';

class ImagePickerField extends StatelessWidget {
  static String routeName = 'imagePicker';
  const ImagePickerField({super.key});

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {}
    Navigator.of(context).pop();
  }

  Future<void> _getImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {}
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.grey.shade400,
          shape: BoxShape.circle),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.photo_library),
                          onPressed: () {
                            _getImageFromGallery(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () {
                            _getImageFromCamera(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.person,
              size: 200,
              color: Colors.white,
            ),
          ),
          Positioned(
              bottom: 25,
              right: 30,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF9177DC)),
                      color: Color(0xFF9177DC),
                      shape: BoxShape.circle),
                  child: Icon(Icons.edit_outlined)))
        ],
      ),
    );
  }
}

class ProfielsScreen extends StatefulWidget {
  static String routeName = 'imagePicker';
  const ProfielsScreen({Key? key}) : super(key: key);

  @override
  State<ProfielsScreen> createState() => _ProfielsScreenState();
}

class _ProfielsScreenState extends State<ProfielsScreen> {
  TextEditingController _dataController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  DateTime? _picked;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pop(PatientDetails.routeName);
                },
                child: Icon(CupertinoIcons.back)),
            SizedBox(
              height: 1,
            ),
            Center(child: ImagePickerField()),
            CustomTextField(
              controller: firstNameController,
              hintText: 'First Name',
              textInputType: TextInputType.text,
              color: Colors.white,
            ),
            CustomTextField(
              controller: lastNameController,
              hintText: 'Last Name',
              textInputType: TextInputType.text,
              color: Colors.white,
            ),
            CustomTextField(
              controller: phoneNumberController,
              hintText: 'Phone Number',
              textInputType: TextInputType.number,
              color: Colors.white,
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              textInputType: TextInputType.text,
              color: Colors.white,
            ),
            TextFormField(
              controller: _dataController,
              decoration: InputDecoration(
                  labelText: 'Date',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              readOnly: true,
              onTap: () {
                _selectDate();
              },
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9177DC)),
                      onPressed: () async {
                        var res = await ApiManager.updateProfile(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            phoneNumberController.text,
                            args == "patient"
                                ? "/patient/update"
                                : args == "doctor"
                                    ? "/doctor/update"
                                    : "/guardian/update");
                        if (res.message == "Done updated") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Profile updated successfully",
                                  style: TextStyle(color: Colors.white))));
                          firstNameController.clear();
                          lastNameController.clear();
                          emailController.clear();
                          phoneNumberController.clear();
                          _dataController.clear();
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Error in updating profile",
                                  style: TextStyle(color: Colors.white))));
                        }
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dataController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
