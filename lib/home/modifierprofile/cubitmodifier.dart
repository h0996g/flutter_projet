import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:agence/Api/constApi.dart';
import 'package:agence/Api/httplaravel.dart';
import 'package:agence/Model/ErrorRegisterAndLoginModel.dart';
import 'package:agence/home/modifierprofile/modifierstate.dart';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CubitModifier extends Cubit<ModifierStates> {
  CubitModifier() : super(InitialModifierStates());
  static CubitModifier get(context) => BlocProvider.of(context);

  Icon iconhiddens = Icon(Icons.visibility);

  bool ishiddens = true;
  void showpasse() {
    if (ishiddens) {
      iconhiddens = Icon(Icons.visibility_off);
      ishiddens = !ishiddens;
    } else {
      iconhiddens = Icon(Icons.visibility);
      ishiddens = !ishiddens;
    }
    emit(HiddenPasswordModifierState());
  }

  Icon iconhiddenss = Icon(Icons.visibility);

  bool ishiddenss = true;
  void showpasses() {
    if (ishiddenss) {
      iconhiddenss = Icon(Icons.visibility_off);
      ishiddenss = !ishiddenss;
    } else {
      iconhiddenss = Icon(Icons.visibility);
      ishiddenss = !ishiddenss;
    }
    emit(HiddenPasswordModifierrState());
  }

  Icon iconhiddensss = Icon(Icons.visibility);

  bool ishiddensss = true;
  void showpassess() {
    if (ishiddensss) {
      iconhiddensss = Icon(Icons.visibility_off);
      ishiddensss = !ishiddensss;
    } else {
      iconhiddensss = Icon(Icons.visibility);
      ishiddensss = !ishiddensss;
    }
    emit(HiddenPasswordModifierrrState());
  }

//---------------------------image profile agence--------------------------------
  final ImagePicker imagePicker = ImagePicker();
  // List<XFile>? imageFileList = [];
  String? base64Agence;
// File? picturefinale ;
  File? selectedImages;

  Future<void> selectImagesGalerymodifier() async {
    final selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImages == null) return;
    final imagetemporaire = File(selectedImages.path);
    this.selectedImages = imagetemporaire;
    // picturefinale= selectedImages as File? ;

    // imageFileList!.add(selectedImages);

    // selectedImages.forEach((element) async {
    Uint8List aa = await selectedImages.readAsBytes();
    base64Agence = base64.encode(aa);

    // print("Image List Length:" + imageFileList!.length.toString());

    emit(AjouterImageProfileState());
  }

  // File? imagecamera;

  Future<void> selectimagecameramodifier() async {
    final selectedImages =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (selectedImages == null) return;
    final imageTemporary = File(selectedImages.path);
    this.selectedImages = imageTemporary;
    // picturefinale=imagecamera as File?;
    Uint8List imageBytes =
        await selectedImages.readAsBytes(); //convert to bytes
    base64Agence = base64.encode(imageBytes);

    // imageFileList!.add(imagecamera);
    emit(AjouterImageProfilecameraState());
  }

  // void removephoto(int index) {
  //   imageFileList?.removeAt(index);
  //   base64List.removeAt(index);
  //   emit(RemovePhotoprofilState());
  // }

//==========================image profile client=============================================

  // List<XFile>? imageFileList = [];
  // List<String> base64List = [];
// File? picturefinale ;
  File? selectedImageclient;
  String base64Client = '';

  Future<void> selectImagesGalerymodifierclient() async {
    final selectedImageclient =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImageclient == null) return;
    final imagetemporaire = File(selectedImageclient.path);
    this.selectedImageclient = imagetemporaire;
    // picturefinale= selectedImages as File? ;

    // imageFileList!.add(selectedImages);

    // selectedImages.forEach((element) async {
    Uint8List aa = await selectedImageclient.readAsBytes();
    base64Client = base64.encode(aa);

    // print("Image List Length:" + imageFileList!.length.toString());
    emit(AjouterImageProfileClientState());
  }

  Future<void> selectimagecameramodifierclient() async {
    final selectedImageclient =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (selectedImageclient == null) return;
    final imageTemporary = File(selectedImageclient.path);
    this.selectedImageclient = imageTemporary;
    // picturefinale=imagecamera as File?;
    Uint8List imageBytes =
        await selectedImageclient.readAsBytes(); //convert to bytes
    base64Client = base64.encode(imageBytes);
    // imageFileList!.add(imagecamera);
    emit(AjouterImageProfilecameraClientState());
  }

  // void removephotoclient(int index) {
  //   imageFileList?.removeAt(index);
  //   base64List.removeAt(index);
  //   emit(RemovePhotoprofilClientState());
  // }

  //----------------------------HTTP REQUESTE-----------------------------------------------//
  void updateAgence(Map<String, dynamic> data) {
    emit(ModifierConditionalLodinState());
    Httplar.httpPost(path: UPDATEAGENCE, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(GoodUpdateAgenceInfoState());
      } else {
        emit(BadUpdateAgenceInfoState());
      }
    }).catchError(((e) {
      print(e.toString());
      emit(BadUpdateAgenceInfoState());
    }));
  }

  void updateClient(Map<String, dynamic> data) {
    emit(ModifierConditionalLodinState());
    Httplar.httpPost(path: UPDATECLIENT, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(GoodUpdateClientInfoState());
      } else {
        emit(BadUpdateClientInfoState());
      }
    }).catchError(((e) {
      print(e.toString());
      emit(BadUpdateClientInfoState());
    }));
  }

  ErrorRegisterAndLoginModel? errorUpdatePasswordModel;
  void updatePasswordAgence(Map<String, dynamic> data) {
    emit(ModifierConditionalLodinState());
    Httplar.httpPost(path: UPDATEAGENCEPASSWORD, data: data).then((value) {
      if (value.statusCode == 200) {
        // var jsonResponse =
        //     convert.jsonDecode(value.body) as Map<String, dynamic>;
        // errorUpdatePasswordModel =
        //     ErrorRegisterAndLoginModel.fromJson(jsonResponse);
        emit(GoodUpdatePasswordAgenceState());
      } else if (value.statusCode == 422) {
        var jsonResponse =
            convert.jsonDecode(value.body) as Map<String, dynamic>;
        errorUpdatePasswordModel =
            ErrorRegisterAndLoginModel.fromJson(jsonResponse);

        emit(GoodUpdatePasswordAgenceState(model: errorUpdatePasswordModel));
      }
    }).catchError((e) {
      print(e.toString());
      emit(BadUpdatePasswordAgenceState());
    });
  }

  void selectimagenull() {
    selectedImageclient = null;
    emit(DeletSelectImageState());
  }
}
