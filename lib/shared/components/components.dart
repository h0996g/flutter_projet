import 'package:agence/home/cubitHome/cupit_home.dart';
import 'package:flutter/material.dart';

Widget defaultForm(
        {required controller,
        int maxline = 1,
        Widget? suffix,
        required context,
        String? sufixText,
        required TextInputType type,
        required Function valid,
        Text? lable,
        Icon? prefixIcon,
        IconButton? sufixIcon,
        TextInputAction? textInputAction,
        bool obscureText = false,
        Function? onFieldSubmitted}) =>
    TextFormField(
      textInputAction: textInputAction,
      style: TextStyle(
          color:
              CupitHome.get(context).dartSwitch ? Colors.white : Colors.black),
      onFieldSubmitted: (k) {
        onFieldSubmitted!();
      },
      validator: (String? value) {
        return valid(value);
      },
      decoration: InputDecoration(
        border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
             ),
        // disabledBorder:  OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(50),
        //     ),
        //   enabledBorder:  OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(50),
        //     borderSide: BorderSide(color: Colors.grey),
        //   ),
          label: lable,
          // border: const OutlineInputBorder(borderSide: BorderSide()),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          suffix: suffix,
          suffixText: sufixText),
      controller: controller,
      maxLines: maxline,
      keyboardType: type,
      obscureText: obscureText,
    );

void Changepage(context, Widget ala) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => ala), (route) => false);
