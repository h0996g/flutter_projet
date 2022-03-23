import 'package:agence/home/cubitHome/cupit_home.dart';
import 'package:flutter/material.dart';

Widget defaultForm(
        {required controller,
        required context,
        required TextInputType type,
        required Function valid,
        required Text lable,
        Icon? prefixIcon,
        IconButton? sufixIcon,
        required TextInputAction textInputAction,
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
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          label: lable,
          border: const OutlineInputBorder(borderSide: BorderSide()),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon),
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
    );
