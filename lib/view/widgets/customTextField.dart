import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.maxline = 1,
     this.controller,
    this.onsave,
    
    this.surfixediconData,
    this.isObscured = false,
    this.surfixediconDataFuncation,
    this.color,
  });
  final String hintText;
  final int maxline;
  final TextEditingController? controller;
  final IconData? surfixediconData;
  final Function? surfixediconDataFuncation;
  final TextInputType textInputType;
  final Function(String?)? onsave;
  final bool isObscured;
  final Color? color;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool hidden =widget.isObscured;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Failed is requiresd';
          } else {
            return null;
          }
        },
        onSaved: widget.onsave,
        maxLines: widget.maxline,
        cursorColor: Colors.grey,
        keyboardType: widget.textInputType,
        obscureText: hidden,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          fillColor: widget.color,
          filled: true,
          suffixIcon: widget.isObscured
              ? IconButton(
            onPressed: () {
              setState(
                    () {
                  hidden = !hidden;
                },
              );
            },
            iconSize: 24,
            splashRadius:1,
            isSelected: !hidden,

            selectedIcon: const Icon(CupertinoIcons.eye),
            icon: const Icon(CupertinoIcons.eye_slash),
          )
              : null,
          focusColor: Colors.grey,
          hintText: widget.hintText,
          labelStyle: TextStyle(
              color: Colors.grey.withOpacity(.6), fontWeight: FontWeight.w500),
          // border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(Colors.grey.shade500),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color ?? Colors.grey));
  }
}
