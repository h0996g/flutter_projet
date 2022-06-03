import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert' as convert;

import 'package:agence/Model/AfficheOffer.dart';
import 'package:agence/login/other/cachhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../Api/constApi.dart';
import '../../Api/httplaravel.dart';
import '../../Model/GetInfoUserModel.dart';
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

  static CupitHome get(context) => BlocProvider.of(context);
  List<Widget> body = [const Offers(), AddPost(), const Setting()];
// --------------------------------------------- Map-------------------------
  LatLng? currentLocation;
  // CameraPosition? initialCameraPosition;

  // void setstatet3Map(CameraPosition newpos) {
  //   currentLocation = newpos.target;
  //   emit(Setstatet3MapState());
  // }

  // void awalLocation(LatLng? currentLocation) {
  //   if (currentLocation == null) {
  //     initialCameraPosition = const CameraPosition(
  //       target: const LatLng(33.515343, 36.289590),
  //       // target: LatLng(36.31789608941112, 6.615674905478954),
  //       zoom: 14.4746,
  //     );
  //   } else {
  //     initialCameraPosition = CameraPosition(
  //       target: LatLng(currentLocation.latitude, currentLocation.longitude),
  //       // target: LatLng(36.31789608941112, 6.615674905478954),
  //       zoom: 14.4746,
  //     );
  //   }
  //   emit(AwalLocationState());
  // }

  // void awelModel(double? latitude, double? longitude) {
  //   if (latitude == null && longitude == null) {
  //     initialCameraPosition = const CameraPosition(
  //       target: const LatLng(33.515343, 36.289590),
  //       // target: LatLng(36.31789608941112, 6.615674905478954),
  //       zoom: 14.4746,
  //     );
  //   } else {
  //     initialCameraPosition = CameraPosition(
  //       target: LatLng(latitude!, longitude!),
  //       // target: LatLng(36.31789608941112, 6.615674905478954),
  //       zoom: 14.4746,
  //     );
  //   }
  //   emit(AwelModelState());
  // }

  // void currentLocationSetStat(LatLng kk) {
  //   currentLocation = initialCameraPosition!.target;
  //   emit(CurrentLocationSetStatState());
  // }

  // int position = 0;

//------------------- T3 Client :::-------------------------------------------
  List<Widget> bodyy = [Offersclient(), Favorite(), Settingsclient()];
  int currentindexa = 0;
  List<String> type_vente = ['Tout', 'Appartement', 'Villa', 'Terrain'];
  int toggelindex = 0;
  void changeToggelIndex(index) {
    toggelindex = index;
    emit(ChangeToggelStates());
  }

  void changenavbar(value) {
    currentindexa = value;
    emit(ChangeNavebarIndex());
  }

  bool isGetOffetType = true;
  DataOffer? allofferModel;
  // String TYPE = '/Tout';
  Future<void> getTypeOffer({
    String type = '/Tout',
  }) async {
    if (isGetOffetType) {
      isGetOffetType = false;
      emit(ConditionalLodinGetAllOfferState());

      Httplar.httpget(path: GETOFFERCATEGORIES + type).then((value) {
        var jsonResponse =
            convert.jsonDecode(value.body) as Map<String, dynamic>;

        allofferModel = DataOffer.fromJson(jsonResponse);
        print('jbt alloffer good');
        print(allofferModel!.data!.offers[0].address);
        // print(dataOfferModel!.data!.offers[0].papiers);
        isGetOffetType = true;
        emit(GoodGetAllOffers());
      }).catchError((e) {
        print(e.toString());
        isGetOffetType = true;
        emit(BadGetAlltOffers());
      });
    }
  }

//--------------------------------------------------------------------------
  // --------------------hadi  rahi t3 add photo fl offer----------------------

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  List<String> base64List = [];
  List<String> base64ListUpdate = [];

  void selectImagesGalery() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      selectedImages.forEach((element) async {
        Uint8List aa = await element.readAsBytes();
        base64List.add(base64.encode(aa));
        base64ListUpdate.add('\"' + base64.encode(aa) + '\"');
      });
    }
    print("Image List Length:" + imageFileList!.length.toString());
    emit(AddImageGoodState());
  }

  void removephoto(int index) {
    imageFileList?.removeAt(index);
    base64List.removeAt(index);
    base64ListUpdate.removeAt(index);
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

    base64ListUpdate.add('\"' + base64.encode(imageBytes) + '\"');
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
  var superficieControllerUpdate = TextEditingController();
  var nEtageControllerUpdate = TextEditingController();
  var nChambresUpdate = TextEditingController();
  var descriptionControllerUpdate = TextEditingController();
  var addressControllerUpdate = TextEditingController();
  var priceControllerUpdate = TextEditingController();

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
  String? wilayavalueDropdown = 'Alger';
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
  var paymentVar = paiment
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
  var speceficationVar = specefication
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
  var papiersVar = papiers
      .map((papiers) => MultiSelectItem<Papiers>(papiers, papiers.name))
      .toList();

// --------------------hadi  rahi t3 MultiDropDown    END  ---------------------

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

  void logOut() {
    emit(ConditionalLodinLogoutState());
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

  Future<void> updateOffer({required Map<String, dynamic> data}) async {
    // var jsonphoto = jsonEncode(base64List);
    // var conditionsjson = jsonEncode(conditionsListhttp);
    // var specificationjson = jsonEncode(specificationListhttp);
    // var papiersjson = jsonEncode(papiersListhttp);
    // var l = jsonEncode(test);
    await Httplar.httpPost(data: data, path: UPDATEOFFER).then((value) {
      // var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;
      // photoModels = PhotoModels.fromJson(jsonResponse);
      // print(jsonResponse);

      // print(jsonDecode(photoModels!.url)[1]);
      // jsondecodephoto = jsonDecode(photoModels!.url);
      print('update good');
      // print(value.body);
      emit(GoodUpdateOfferState());
    }).catchError((e) {
      print(e.toString());
      emit(BadUpdateOfferState());
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
    currentLocation = null;

    paymentVar = paiment
        .map((payment) =>
            MultiSelectItem<Conditions_paiment>(payment, payment.name))
        .toList();
    speceficationVar = specefication
        .map((specefication) =>
            MultiSelectItem<Specefication>(specefication, specefication.name))
        .toList();
    papiersVar = papiers
        .map((papiers) => MultiSelectItem<Papiers>(papiers, papiers.name))
        .toList();

    emit(InitialHomeState());
  }

  void resetValuePhoto() {
    imageFileList = [];
    base64List = [];
    base64ListUpdate = [];
  }

  //------------------------- te3 l3yn te3 password f modifier profile------------------------------------------
  Icon iconhiddens = const Icon(Icons.visibility);

  bool ishiddens = true;
  void showpasse() {
    if (ishiddens) {
      iconhiddens = const Icon(Icons.visibility_off);
      ishiddens = !ishiddens;
    } else {
      iconhiddens = const Icon(Icons.visibility);
      ishiddens = !ishiddens;
    }
    emit(HiddenPasswordModifierState());
  }

  DataOffer? offerAgencModel;
  Future<void> getOfferAgence() async {
    // offerAgencModel = null;
    emit(ConditionalLodinOfferAgenceState());
    Httplar.httpget(path: GETOFFERSAGENCE).then((value) {
      var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;

      offerAgencModel = DataOffer.fromJson(jsonResponse);
      print('ook');
      // print(offerAgencModel!.data!.offers[0].address);
      // print(offerAgencModel!.data!.offers[0].latitude);
      // print(offerAgencModel!.data!.offers[0].longitude);
      emit(GoodGetOffersAgence());
    }).catchError((e) {
      print(e.toString());
      emit(BadGetOffersAgence());
    });
  }

//------------------------hadi t3 get information-----------------------------
  GetInfoUser? getinfouserModel;
  Future<void> getinformationAgenceOrClient() async {
    emit(ConditionalLodinInfoState());
    Httplar.httpget(path: GETINFOUSER).then((value) {
      var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;

      getinfouserModel = GetInfoUser.fromJson(jsonResponse);
      print('ook user info');
      // print(getinfouserModel!.agence!.address);
      print(value.body);
      // print(getinfouserModel!.photo);

      emit(GoodGetInfoUserState());
    }).catchError((e) {
      print(e.toString());
      emit(BaadGetInfoUserState());
    });
  }

  //----------------favorite------------------------------------

  // -----------------------------------------------------------------
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
