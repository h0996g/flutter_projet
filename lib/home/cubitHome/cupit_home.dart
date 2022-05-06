import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:agence/login/other/cachhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../Api/constApi.dart';
import '../../Api/httplaravel.dart';
import '../../clienthome/favorite.dart';
import '../../clienthome/offersclient.dart';
import '../../clienthome/settingsclient.dart';
import '../addpost.dart';
import '../offers.dart';
import '../setting.dart';
import 'homeStates.dart';
//aaa

class CupitHome extends Cubit<HomeStates> {
  CupitHome() : super(InitialHomeState());
  List<Widget> body = [const Offers(), AddPost(), const Setting()];
  List<Widget> bodyy = [Offersclient(), Favorite(), Settingsclient()];

  // --------------------hadi  rahi t3 add photo fl offer----------------------

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  List<String> base64List = [];

  void selectImagesGalery() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      selectedImages.forEach((element) async {
        Uint8List aa = await element.readAsBytes();
        base64List.add(base64.encode(aa));
      });
    }
    print("Image List Length:" + imageFileList!.length.toString());
    emit(AddImageGoodState());
  }

  void removephoto(int index) {
    imageFileList?.removeAt(index);
    base64List.removeAt(index);
    emit(RemovePhotoState());
  }

  File? imagecamera;

  Future<void> selectimagecamera() async {
    final imagecamera =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagecamera == null) return;
    final imageTemporary = File(imagecamera.path);
    this.imagecamera = imageTemporary;
    Uint8List imageBytes = await imagecamera.readAsBytes(); //convert to bytes
    base64List.add(base64.encode(imageBytes));
    imageFileList!.add(imagecamera);
    emit(AddImageCameraGoodState());
  }

  // --------------------hadi  rahi t3 add photo fl offer    END----------------------

  //-----------------------DropDown---------------------------------------------------------------//

  Map<String, bool> isvisibility = {'N-champre': true, 'etages': true};

  List papiersListhttp = [];
  List specificationListhttp = [];
  List conditionsListhttp = [];
  var superficieController = TextEditingController();
  var nEtageController = TextEditingController();
  var nChambres = TextEditingController();
  var descriptionController = TextEditingController();
  var addressController = TextEditingController();
  var priceController = TextEditingController();

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

  final vende = ['Vente', 'Echange', 'Vacances'];
  final appartement = ['Appartement', 'Terrain', 'Villa', 'Studio'];
  String? wilayavalueDropdown;
  String? vendevalueDrop = 'Vente';
  String? appartementvalueDrop = 'Appartement';

  appartementDropDown(value) {
    appartementvalueDrop = value;
    // print(appartement.indexOf(value));
    if (appartementvalueDrop == 'Appartement') {
      isvisibility['N-champre'] = true;
      isvisibility['etages'] = true;
    } else if (appartementvalueDrop == 'Terrain') {
      isvisibility['N-champre'] = false;
      isvisibility['etages'] = false;
    } else if (appartementvalueDrop == 'Villa') {
      isvisibility['N-champre'] = true;
      isvisibility['etages'] = true;
    } else if (appartementvalueDrop == 'Studio') {
      isvisibility['N-champre'] = true;
      isvisibility['etages'] = false;
    }
    print(appartementvalueDrop);

    emit(ChangevalueDropdownState());
  }

  vendeDropDown(value) {
    vendevalueDrop = value;
    print(vendevalueDrop);

    // print(vende.indexOf(value));

    emit(ChangevalueDropdownState());
  }

  wilaraDropdown(value) {
    wilayavalueDropdown = value;
    print(wilayavalueDropdown);

    emit(ChangevalueDropdownState());
  }

//------------------------------End DropDown-------------------------

  // --------------------hadi  rahi t3 MultiDropDown----------------------

  static List<Conditions_paiment> paiment = [
    Conditions_paiment(id: 1, name: "Promesse de vente possible"),
    Conditions_paiment(id: 2, name: "Paiment par tranches possible"),
    Conditions_paiment(id: 3, name: "Credit bancaire possible"),
  ];
  final paymentVar = paiment
      .map((payment) =>
          MultiSelectItem<Conditions_paiment>(payment, payment.name))
      .toList();

  static List<Specefication> specefication = [
    Specefication(id: 1, name: "Jardin"),
    Specefication(id: 2, name: "Electricite"),
    Specefication(id: 3, name: "Gaz"),
    Specefication(id: 4, name: "Eau"),
    Specefication(id: 5, name: "Meuble"),
    Specefication(id: 6, name: "Garage"),
  ];
  final speceficationVar = specefication
      .map((specefication) =>
          MultiSelectItem<Specefication>(specefication, specefication.name))
      .toList();

  static List<Papiers> papiers = [
    Papiers(id: 1, name: "Promotion immobiliere"),
    Papiers(id: 2, name: "Acte notarie"),
    Papiers(id: 3, name: "Acte dans l'indivision"),
    Papiers(id: 4, name: "Papier timbre"),
    Papiers(id: 5, name: "Decision"),
    Papiers(id: 6, name: "Livret foncier"),
    Papiers(id: 7, name: "Parmis de construire"),
  ];
  final papiersVar = papiers
      .map((papiers) => MultiSelectItem<Papiers>(papiers, papiers.name))
      .toList();

// --------------------hadi  rahi t3 MultiDropDown    END  ---------------------

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

  void logOut() {
    emit(ConditionalLodinState());
    Httplar.httpget(path: LOGOUT).then((value) {
      TOKEN = '';

      emit(LougOutSuccesState());
    }).catchError((e) {
      print(e.toString());

      emit(LougOutBadState());
    });
  }

  Future<void> savePhotoBd({required Map<String, dynamic> data}) async {
    // var jsonphoto = jsonEncode(base64List);
    // var conditionsjson = jsonEncode(conditionsListhttp);
    // var specificationjson = jsonEncode(specificationListhttp);
    // var papiersjson = jsonEncode(papiersListhttp);
    // var l = jsonEncode(test);
    await Httplar.httpPost(data: data, path: ADDOFFER).then((value) {
      // var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;
      // photoModels = PhotoModels.fromJson(jsonResponse);
      // print(jsonResponse);

      // print(jsonDecode(photoModels!.url)[1]);
      // jsondecodephoto = jsonDecode(photoModels!.url);
      print('succes send');
      print(value.body);
      emit(CreateOfferSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(CreateOfferBadState());
    });
  }

  void resetValueoffer() {
    papiersListhttp = [];
    specificationListhttp = [];
    conditionsListhttp = [];
    superficieController = TextEditingController();
    nEtageController = TextEditingController();
    nChambres = TextEditingController();
    descriptionController = TextEditingController();
    addressController = TextEditingController();
    priceController = TextEditingController();
    imageFileList = [];
    base64List = [];
  }
}

class Conditions_paiment {
  final int id;
  final String name;

  Conditions_paiment({
    required this.id,
    required this.name,
  });
}

class Specefication {
  final int id;
  final String name;

  Specefication({
    required this.id,
    required this.name,
  });
}

class Papiers {
  final int id;
  final String name;

  Papiers({
    required this.id,
    required this.name,
  });
}
