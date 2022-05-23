import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../Api/constApi.dart';
import '../Api/httplaravel.dart';
import '../Model/AfficheOffer.dart';
import 'CubitOfferDetailState.dart';

class CubitDetail extends Cubit<DetailStates> {
  CubitDetail() : super(InitialDetailState());
  static CubitDetail get(context) => BlocProvider.of(context);

  int indexAgence = 0;
  int indexClient = 0;

  void changeNavDetailAgence(int index) {
    indexAgence = index;
    emit(DeclarIndexState());
  }

  void changeNavDetailClient(int index) {
    indexClient = index;
    emit(DeclarIndexState());
  }

  DataOffer? getFavoritesmodel;
  Future<void> getFavorites() async {
    getFavoritesmodel = null;
    emit(ConditionalLodinGetFavoritesState());
    await Httplar.httpget(path: GETALLFAVORITE).then((value) {
      var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;

      getFavoritesmodel = DataOffer.fromJson(jsonResponse);
      print('ook get favorites');
      // print(dataOfferModel!.data!.offers[0].papiers);
      emit(GoodGetFavorites());
    }).catchError((e) {
      print(e.toString());
      print('majebt walo fav');
      emit(BadGetFavorites());
    });
  }

  Future<void> deletOffer({required Map<String, dynamic> data}) async {
    emit(LodinDeleteOffer());
    await Httplar.httpPost(data: data, path: DELETEOFFER).then((value) {
      print('Good Delete');
      // print(value.body);
      emit(GoodDeleteOffersState());
    }).catchError((e) {
      print(e.toString());
      emit(BadDeleteOffersState());
    });
  }

  //--------------------modifier offre--------------
  //--------dropdown
//   final items = [
//     'Alger',
//     'Blida',
//     'Tipaza',
//     'Boumerdes',
//     'Oran',
//     'Adrar',
//     'Chlef',
//     'Laghouat',
//     'Oum el bouaghi',
//     'Batna',
//     'Bejaia',
//     'Biskra',
//     'Bechar',
//     'Bouira',
//     'Tamenrasset',
//     'Tebessa',
//     'Tlemcen',
//     'Tiaret',
//     'Tizi ouzou',
//     'Djelfa',
//     'Jijle',
//     'Setif',
//     'Saida',
//     'Skikda',
//     'Sidi bel abbes',
//     'Annaba',
//     'Guelma',
//     'Constantine',
//     'Medea',
//     'Mostaganem',
//     'Msila',
//     'Mascara',
//     'Ouargla',
//     'El bayadh',
//     'Illizi',
//     'Bordj bou arreridj',
//     'El taref',
//     'Tindouf',
//     'Tissemsilt',
//     'El ouad',
//     'Khenchela',
//     'Souk ahras',
//     'Mila',
//     'Ain defla',
//     'Naama',
//     'Ain temouchent',
//     'Ghardaia',
//     'Relizane'
//   ];

//   Map<String, bool> isvisibility = {'N-champre': true, 'etages': true};

//   List papiersListhttp = [];
//   List specificationListhttp = [];
//   List conditionsListhttp = [];
//   var superficieController = TextEditingController();
//   var nEtageController = TextEditingController();
//   var nChambres = TextEditingController();
//   var descriptionController = TextEditingController();
//   var addressController = TextEditingController();
//   var priceController = TextEditingController();

//   final vende = ['Vente', 'Echange', 'Vacances'];
//   final appartement = ['Appartement', 'Terrain', 'Villa', 'Studio'];
//   String? wilayavalueDropdown;
//   String? vendevalueDrop = 'Vente';
//   String? appartementvalueDrop = 'Appartement';
// //-----------------
//   appartementDropDown(value) {
//     appartementvalueDrop = value;
//     // print(appartement.indexOf(value));
//     if (appartementvalueDrop == 'Appartement') {
//       isvisibility['N-champre'] = true;
//       isvisibility['etages'] = true;
//     } else if (appartementvalueDrop == 'Terrain') {
//       isvisibility['N-champre'] = false;
//       isvisibility['etages'] = false;
//     } else if (appartementvalueDrop == 'Villa') {
//       isvisibility['N-champre'] = true;
//       isvisibility['etages'] = true;
//     } else if (appartementvalueDrop == 'Studio') {
//       isvisibility['N-champre'] = true;
//       isvisibility['etages'] = false;
//     }
//     print(appartementvalueDrop);

//     emit(ChangevalueDropdownState());
//   }

// //---------
//   vendeDropDown(value) {
//     vendevalueDrop = value;
//     print(vendevalueDrop);

//     // print(vende.indexOf(value));

//     emit(ChangevalueDropdownState());
//   }

//   //----------
//   wilaraDropdown(value) {
//     wilayavalueDropdown = value;
//     print(wilayavalueDropdown);

//     emit(ChangevalueDropdownState());
//   }

//   //-----end drop down
// //-----------multidropdown
//   static List<Conditions_paiment> paiment = [
//     Conditions_paiment(id: 1, name: "Promesse de vente possible"),
//     Conditions_paiment(id: 2, name: "Paiment par tranches possible"),
//     Conditions_paiment(id: 3, name: "Credit bancaire possible"),
//   ];
//   final paymentVar = paiment
//       .map((payment) =>
//           MultiSelectItem<Conditions_paiment>(payment, payment.name))
//       .toList();

//   static List<Specefication> specefication = [
//     Specefication(id: 1, name: "Jardin"),
//     Specefication(id: 2, name: "Electricite"),
//     Specefication(id: 3, name: "Gaz"),
//     Specefication(id: 4, name: "Eau"),
//     Specefication(id: 5, name: "Meuble"),
//     Specefication(id: 6, name: "Garage"),
//   ];
//   final speceficationVar = specefication
//       .map((specefication) =>
//           MultiSelectItem<Specefication>(specefication, specefication.name))
//       .toList();

//   static List<Papiers> papiers = [
//     Papiers(id: 1, name: "Promotion immobiliere"),
//     Papiers(id: 2, name: "Acte notarie"),
//     Papiers(id: 3, name: "Acte dans l'indivision"),
//     Papiers(id: 4, name: "Papier timbre"),
//     Papiers(id: 5, name: "Decision"),
//     Papiers(id: 6, name: "Livret foncier"),
//     Papiers(id: 7, name: "Parmis de construire"),
//   ];
//   final papiersVar = papiers
//       .map((papiers) => MultiSelectItem<Papiers>(papiers, papiers.name))
//       .toList();
//   //-------multidropdown end
// //------------------------modifier offre end -----------------
// //------------------modifier photo f offre--------------

//   Future<void> savePhotoBd({required Map<String, dynamic> data}) async {
//     await Httplar.httpPost(data: data, path: ADDOFFER).then((value) {
//       print('succes send');
//       print(value.body);
//       emit(CreateOfferSuccessState());
//     }).catchError((e) {
//       print(e.toString());
//       emit(CreateOfferBadState());
//     });
//   }

//   void resetValueoffer() {
//     papiersListhttp = [];
//     specificationListhttp = [];
//     conditionsListhttp = [];
//     superficieController = TextEditingController();
//     nEtageController = TextEditingController();
//     nChambres = TextEditingController();
//     descriptionController = TextEditingController();
//     addressController = TextEditingController();
//     priceController = TextEditingController();
//     imageFileList = [];
//     base64List = [];
//     emit(InitialDetailState());
//   }

//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imageFileList = [];
//   List<String> base64List = [];

//   void selectImagesGalery() async {
//     final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList!.addAll(selectedImages);
//       selectedImages.forEach((element) async {
//         Uint8List aa = await element.readAsBytes();
//         base64List.add(base64.encode(aa));
//       });
//     }
//     print("Image List Length:" + imageFileList!.length.toString());
//     emit(AddImageGoodState());
//   }

//   void removephoto(int index) {
//     imageFileList?.removeAt(index);
//     base64List.removeAt(index);
//     emit(RemovePhotoState());
//   }

//   File? imagecamera;

//   Future<void> selectimagecamera() async {
//     final imagecamera =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (imagecamera == null) return;
//     final imageTemporary = File(imagecamera.path);
//     this.imagecamera = imageTemporary;
//     Uint8List imageBytes = await imagecamera.readAsBytes(); //convert to bytes
//     base64List.add(base64.encode(imageBytes));
//     imageFileList!.add(imagecamera);
//     emit(AddImageCameraGoodState());
//   }

//-----------------------------------------favorite--------------------------------------------
  bool colorfav = false;
  getexistfav({
    required Map<String, dynamic> data,
  }) {
    emit(LoadingExFavState());

    Httplar.httpPost(path: CHECKFAVORITE, data: data).then((value) async {
      print('dkholt l verifier favoris');
      if (value.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(value.body) as Map<String, dynamic>;
        print(jsonResponse);
        print('ryh nrodu true');
        await Future.delayed(Duration(seconds: 1));
        colorfav = true;

        emit(GoodGetFavState());
      } else if (value.statusCode == 201) {
        var jsonResponse =
            convert.jsonDecode(value.body) as Map<String, dynamic>;
        print(jsonResponse);
        print('ryh nrodu false');
        await Future.delayed(Duration(seconds: 1));
        colorfav = false;

        emit(GoodGetFavState());
      }
    }).catchError((error) {
      print('ki l3ada erreur');
      // print(error.toString());
      emit(BaadGetFavState());
    });
  }

  Future<void> changefav({required Map<String, dynamic> data, bool? dd}) async {
    emit(LoadingChangeFavState());
    if (dd == true) {
      print('true');

      await Httplar.httpdelete(path: CHANGEFAVTOFALSE, data: data)
          .then((value) {
        colorfav = false;
        emit(GoodChangeFavoriteState());
      }).catchError((error) {
        print(error.toString());
        emit(BadChangeFavoriteState());
      });

      // emit(ExistFavState());
    } else if (dd == false) {
      print('false');
      Httplar.httpPost(path: CHANGEFAVTOTRUE, data: data).then((value) {
        colorfav = true;
        emit(GoodChangeFavoriteState());
      }).catchError((error) {
        print(error.toString());

        emit(BadChangeFavoriteState());
      });
    }
  }

// ------------------------------------------------------------------------------------

//----------------------messages--------------------------------------------------------

  Future<void> sendMessage({required Map<String, dynamic> data}) async {
    await Httplar.httpPost(data: data, path: SENDMESSAGE).then((value) {
      print('succes msg send');
      print(value.body);
      emit(GoodSendMsgState());
    }).catchError((e) {
      print(e.toString());
      emit(BadSendMsgState());
    });
  }

  var allmsgmodel;
  Future<void> getAllMsg({required Map<String, dynamic> data}) async {
    emit(LodinGetAllMsgOfferState());
    await Httplar.httpPost(data: data, path: GETALLMSG).then((value) {
      var jsonResponse = convert.jsonDecode(value.body);
      allmsgmodel = jsonResponse;
      print(allmsgmodel);
      emit(GoodGetAllMsgState());
    }).catchError((e) {
      print(e.toString());
      emit(BadGetAllMsgState());
    });
  }

  Future<void> deleteMsg({required Map<String, dynamic> data}) async {
    emit(LodinDeleteMsgOfferState());
    await Httplar.httpPost(data: data, path: DELETEMSGOFFER).then((value) {
      // var jsonResponse = convert.jsonDecode(value.body);
      // allmsgmodel = jsonResponse;
      // print(allmsgmodel);
      print('tna7a msg');
      emit(GoodDeleteMsgState());
    }).catchError((e) {
      print(e.toString());

      print('ma7abch ytna7a msg');
      emit(BadDeleteMsgOfferState());
    });
  }

  var namAndphoen;
  Future<void> getNameandPhone({required Map<String, dynamic> data}) async {
    emit(LodinNamAndPhoneState());
    // var jsonphoto = jsonEncode(base64List);
    // var conditionsjson = jsonEncode(conditionsListhttp);
    // var specificationjson = jsonEncode(specificationListhttp);
    // var papiersjson = jsonEncode(papiersListhttp);
    // var l = jsonEncode(test);
    await Httplar.httpPost(data: data, path: GETPHONEAGENCE).then((value) {
      var jsonResponse = convert.jsonDecode(value.body);
      //  photoModels = PhotoModels.fromJson(jsonResponse);
      namAndphoen = jsonResponse;
      print(namAndphoen);
      // print(value.body);
      // print(jsonResponse);

      // print(jsonDecode(photoModels!.url)[1]);
      // jsondecodephoto = jsonDecode(photoModels!.url);
      print('get num and phone Good ');
      // print(value.body);
      emit(GoodNamAndPhoneState());
    }).catchError((e) {
      print(e.toString());
      print('oooooooooooooo kyn mochkol phone');
      emit(BadNamAndPhoneState());
    });
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
