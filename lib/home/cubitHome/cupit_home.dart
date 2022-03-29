import 'package:agence/login/other/cachhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../clienthome/favorite.dart';
import '../../clienthome/offersclient.dart';
import '../../clienthome/settingsclient.dart';
import '../add.dart';
import '../offers.dart';
import '../setting.dart';
import 'homeStates.dart';

class CupitHome extends Cubit<ShopeHomeStates> {
  CupitHome() : super(InitialHomeState());
  List<Widget> body = [const Offers(), const AddPost(), const Setting()];
  List<Widget> bodyy = [ Offersclient(),  Favorite(),  Settingsclient()];

  static CupitHome get(context) => BlocProvider.of(context);
  int currentindex = 0;
  void changenav(value) {
    currentindex = value;
    emit(ChangeNaveIndex());
  }

  int currentindexa = 0;
  void changenavbar(value) {
    currentindexa = value;
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
      emit(ChangeSwitchStates());
    });
  }
}
