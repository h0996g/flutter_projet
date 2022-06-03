import 'dart:convert';
import 'dart:io';

import 'package:agence/home/cubitHome/homeStates.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home/cubitHome/cupit_home.dart';

import '../home/home.dart';
import 'formulairemodifieroffre.dart';
import 'modifierediterphoto.dart';

class Modifieroffrephoto extends StatelessWidget {
  final int position;
  Modifieroffrephoto({Key? key, required this.position}) : super(key: key);

  Map<String, dynamic> sendinfoOffer = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'veuillez choisir une option',
                              style: TextStyle(color: Colors.black),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    CupitHome.get(context).selectimagecamera();
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Camera',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    CupitHome.get(context).selectImagesGalery();
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Galery',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                    // CupitHome.get(context).selectimagecamera();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.black
                                : Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 10))
                      ],
                      color: CupitHome.get(context).dartSwitch
                          ? Color(0xff131313)
                          : Colors.grey[200],
                    ),
                    height: 500,
                    width: 350,
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Icon(
                        Icons.add_to_drive,
                        size: 90,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Transferer les images',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Selectionner ou glisser-deplacer les images depuis votre apparail',
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  CupitHome.get(context).imageFileList!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemBuilder: (BuildContext context, int index) {
                                return Image.file(
                                  File(CupitHome.get(context)
                                      .imageFileList![index]
                                      .path),
                                  fit: BoxFit.cover,
                                );
                              }),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Modifierediterphoto()));
                          },
                          icon: Icon(Icons.edit),
                          color: CupitHome.get(context).dartSwitch
                              ? Colors.white
                              : Colors.red,
                        ),
                      ])
                    ]),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          print(CupitHome.get(context)
                              .addressControllerUpdate
                              .text);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Formulairemodifier(
                                        position: position,
                                      )),
                              (route) => false);
                        },
                        child: const Text('RETOUR')),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () async {
                          sendinfoOffer = {
                            'id':
                                ' ${CupitHome.get(context).allofferModel!.data!.offers[position].id}',
                            'type_vente':
                                CupitHome.get(context).appartementvalueDrop,
                            'address': CupitHome.get(context)
                                .addressControllerUpdate
                                .text,
                            'description': CupitHome.get(context)
                                .descriptionControllerUpdate
                                .text,
                            'price': CupitHome.get(context)
                                .priceControllerUpdate
                                .text,
                            'space': CupitHome.get(context)
                                .superficieControllerUpdate
                                .text,
                            'n_etage': CupitHome.get(context)
                                .nEtageControllerUpdate
                                .text,
                            'n_chambre':
                                CupitHome.get(context).nChambresUpdate.text,
                            'wilaya':
                                CupitHome.get(context).wilayavalueDropdown,
                            'photo': jsonEncode(
                                "${CupitHome.get(context).base64ListUpdate}"),
                            'latitude':
                                '${CupitHome.get(context).currentLocation!.latitude}',
                            'longitude':
                                '${CupitHome.get(context).currentLocation!.longitude}'
                            // 'type_offer': CupitHome.get(context).vendevalueDrop,
                            // 'condition_de_paiment': jsonEncode(
                            //     "${CupitHome.get(context).conditionsListhttp}"),
                            // 'specification': jsonEncode(
                            //     "${CupitHome.get(context).specificationListhttp}"),
                            // 'papiers': jsonEncode(
                            //     "${CupitHome.get(context).papiersListhttp}")
                          };
                          CupitHome.get(context)
                              .updateOffer(data: sendinfoOffer)
                              .then((value) {
                            CupitHome.get(context).resetValueoffer();
                            CupitHome.get(context).resetValuePhoto();
                          });
                        },
                        child: const Text('CONFIRMER'))
                  ],
                ),
              ),
            )
          ]),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is GoodUpdateOfferState) {
          CupitHome.get(context).getOfferAgence().then((value) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false);
          });
          Fluttertoast.showToast(
              msg: 'Update offer success',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is BadUpdateOfferState) {
          Fluttertoast.showToast(
              msg: 'error',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
    );
  }
}
