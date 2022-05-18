import 'dart:convert';
import 'dart:io';


import 'package:agence/offersdetails/CubitOfferDetailState.dart';
import 'package:agence/offersdetails/cubitOfferDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/addphoto/editphoto.dart';
import '../home/cubitHome/cupit_home.dart';
import '../home/home.dart';

class Modifieroffrephoto extends StatelessWidget {
   Modifieroffrephoto({Key? key}) : super(key: key);

   Map<String, dynamic> sendinfoOffer = {};

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CubitDetail, DetailStates>(
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
                                      CubitDetail.get(context).selectimagecamera();
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
                                      CubitDetail.get(context).selectImagesGalery();
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
                                CubitDetail.get(context).imageFileList!.length,
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
                                      builder: (context) => EditPhoto()));
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                                    (route) => false);
                          },
                          child: const Text('RETOUR')),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () async {
                            sendinfoOffer = {
                              'type_vente':
                              CubitDetail.get(context).appartementvalueDrop,
                              'address':
                              CubitDetail.get(context).addressController.text,
                              'description': CubitDetail.get(context)
                                  .descriptionController
                                  .text,
                              'price':
                              CubitDetail.get(context).priceController.text,
                              'space': CubitDetail.get(context)
                                  .superficieController
                                  .text,
                              'n_etage':
                              CubitDetail.get(context).nEtageController.text,
                              'n_chambre': CubitDetail.get(context).nChambres.text,
                              'wilaya':
                              CubitDetail.get(context).wilayavalueDropdown,
                              'photo':
                              jsonEncode(CupitHome.get(context).base64List),
                              'type_offer': CubitDetail.get(context).vendevalueDrop,
                              'condition_de_paiment': jsonEncode(
                                  CubitDetail.get(context).conditionsListhttp),
                              'specification': jsonEncode(
                                  CubitDetail.get(context).specificationListhttp),
                              'papiers': jsonEncode(
                                  CubitDetail.get(context).papiersListhttp)
                            };
                            CubitDetail.get(context)
                                .savePhotoBd(data: sendinfoOffer)
                                .then((value) {
                              CubitDetail.get(context).resetValueoffer();
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
    listener: (BuildContext context, Object? state) {},

    );
  }
}
