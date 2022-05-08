import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:agence/home/modifierprofile/modifierstate.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class CubitModifier extends Cubit<ModifierStates> {
  CubitModifier() : super(InitialModifierStates());
  static CubitModifier get(context) => BlocProvider.of(context);


  Icon iconhiddens =  Icon(Icons.visibility);

  bool ishiddens = true;
  void showpasse() {
    if (ishiddens) {
      iconhiddens =  Icon(Icons.visibility_off);
      ishiddens = !ishiddens;
    } else {
      iconhiddens =  Icon(Icons.visibility);
      ishiddens = !ishiddens;
    }
    emit(HiddenPasswordModifierState());
  }


//---------------------------image profile--------------------------------
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  List<String> base64List = [];

  XFile? oo ;

  void selectImagesGalerymodifier() async {
    final XFile? selectedImages = await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImages==null) return;
      imageFileList!.add(selectedImages);

      // selectedImages.forEach((element) async {
        Uint8List aa = await selectedImages.readAsBytes();
        base64List.add(base64.encode(aa));


    // print("Image List Length:" + imageFileList!.length.toString());
    emit(AjouterImageProfileState());
  }


  File? imagecamera ;

  Future<void> selectimagecameramodifier() async {
    final imagecamera =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagecamera == null) return;
     final imageTemporary = File(imagecamera.path);
     this.imagecamera = imageTemporary;
    Uint8List imageBytes = await imagecamera.readAsBytes(); //convert to bytes
    base64List.add(base64.encode(imageBytes));
    // imageFileList!.add(imagecamera);
    emit(AjouterImageProfilecameraState());
  }



  void removephoto(int index) {
    imageFileList?.removeAt(index);
    base64List.removeAt(index);
    emit(RemovePhotoprofilState());
  }



}