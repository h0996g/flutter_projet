import 'dart:io';

import 'package:agence/login/other/cachhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../clienthome/favorite.dart';
import '../../clienthome/offersclient.dart';
import '../../clienthome/settingsclient.dart';
import '../add.dart';
import '../offers.dart';
import '../setting.dart';
import 'homeStates.dart';

class CupitHome extends Cubit<ShopeHomeStates> {
  CupitHome() : super(InitialHomeState());
  List<Widget> body = [const Offers(), AddPost(), const Setting()];
  List<Widget> bodyy = [Offersclient(), Favorite(), Settingsclient()];
  final items = [
    'Alger',
    'Blida',
    'Tipaza',
    'Boumerdes',
    'Oran',
    'Adrar',
    'Chlef',
    'Laghouat',
    'Oum el bouaghi',
    'Batna',
    'Bejaia',
    'Biskra',
    'Bechar',
    'Bouira',
    'Tamenrasset',
    'Tebessa',
    'Tlemcen',
    'Tiaret',
    'Tizi ouzou',
    'Djelfa',
    'Jijle',
    'Setif',
    'Saida',
    'Skikda',
    'Sidi bel abbes',
    'Annaba',
    'Guelma',
    'Constantine',
    'Medea',
    'Mostaganem',
    'Msila',
    'Mascara',
    'Ouargla',
    'El bayadh',
    'Illizi',
    'Bordj bou arreridj',
    'El taref',
    'Tindouf',
    'Tissemsilt',
    'El ouad',
    'Khenchela',
    'Souk ahras',
    'Mila',
    'Ain defla',
    'Naama',
    'Ain temouchent',
    'Ghardaia',
    'Relizane'
  ];
  String? valueDropdown;

  changevalueDropdown(value) {
    valueDropdown = value;
    emit(ChangevalueDropdownState());
  }

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

  late File imageGlobal;
  Future pickerImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    imageGlobal = imageTemporary;
  }
}
