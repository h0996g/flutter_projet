import 'package:agence/login/other/cachhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add.dart';
import '../offers.dart';
import '../setting.dart';
import 'homeStates.dart';

class CupitHome extends Cubit<ShopeHomeStates> {
  CupitHome() : super(InitialHomeState());
  List<Widget> body = [const Offers(), const AddPost(), const Setting()];

  static CupitHome get(context) => BlocProvider.of(context);
  int currentindex = 0;
  void changenav(value) {
    currentindex = value;
    emit(ChangeNaveIndex());
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
