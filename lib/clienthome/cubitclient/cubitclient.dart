import 'package:agence/clienthome/cubitclient/stateclient.dart';
import 'package:agence/clienthome/favorite.dart';
import 'package:agence/clienthome/offersclient.dart';
import 'package:agence/clienthome/settingsclient.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/other/cachhelper.dart';

//m3ndhum hta m3a mb3d nehihum

class Cubitclient extends Cubit<Clientstates>{
  Cubitclient() : super(Initialclient());

  List<Widget> body = [ Offersclient(),  Favorite(),  Settingsclient()];

  static Cubitclient get(context) => BlocProvider.of(context);
  int currentindex = 0;
  void changenavbar(value) {
    currentindex = value;
    emit(ChangeNavebarIndex());
  }

  bool dartSwitch = false;
  void changeSwitch({value, darkswitchmain}) {
    if (darkswitchmain != null) {
      dartSwitch = darkswitchmain;
    } else {
      dartSwitch = value;
    }
    CachHelper.putcache(key: 'dartswitch', value: dartSwitch).then((value) {
      emit(ChangeSwitchStatesClient());
    });
  }



}