import 'package:agence/Api/constApi.dart';
import 'package:agence/Model/RegisterAgenceModel.dart';
import 'dart:convert' as convert;
import 'package:agence/diohelper/dio_helper.dart';
import 'package:agence/login/cupitlogin/statesh.dart';
import 'package:agence/modeles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Api/httplaravel.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  Icon iconhidden = const Icon(Icons.visibility);
  late LoginModel json;

  void login({required String pass, required String email}) {
    emit(ConditionalLodinState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': pass})
        .then((value) {
      // print(value.data);
      json = LoginModel.fromjson(value.data);
      print(json.status);
      print(json.data?.token);
      print(json.data?.email);
      emit(GoodLoginState(json));
    }).catchError((error) {
      print(error.toString());
      emit(BadLoginState(error));
    });
  }

  RegisterAgenceModel? registerAgenceModel;
  void registerAgence({required Map<String, dynamic> data}) {
    emit(ConditionalLodinState());
    Httplar.httpPost(path: REGISTERAGENCE, data: data).then((value) {
      var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;
      registerAgenceModel = RegisterAgenceModel.fromJson(jsonResponse);
      print(registerAgenceModel!.user!.email);
      emit(RegisterAgenceSuccesState(registerAgenceModel));
    }).catchError((e) {
      print(e.toString());
      emit(RegisterAgenceBadState());
    });
  }

  bool ishidden = true;
  void showpass() {
    if (ishidden) {
      iconhidden = const Icon(Icons.visibility_off);
      ishidden = !ishidden;
    } else {
      iconhidden = const Icon(Icons.visibility);
      ishidden = !ishidden;
    }
    emit(HiddenPasswordState());
  }
}
