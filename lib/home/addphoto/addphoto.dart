import 'dart:io';

import 'package:agence/home/addphoto/editphoto.dart';
import 'package:agence/home/cubitHome/cupit_home.dart';
import 'package:agence/home/cubitHome/homeStates.dart';
import 'package:agence/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Addphoto extends StatelessWidget {
  const Addphoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, ShopeHomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
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
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                    color: Colors.grey[200],
                  ),
                  height: 500,
                  width: 350,
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Icon(
                        Icons.add_to_drive,
                        size: 90,
                      ),
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
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Selectionner ou glisser-deplacer les images depuis votre apparail',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
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
                                  builder: (context) => EditPhoto()));
                        },
                        icon: const Icon(Icons.edit),
                        color: Colors.red,
                      ),
                    ])
                  ]),
                ),
              ),
            ),
            const Spacer(),
            Padding(
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
                      onPressed: () {}, child: const Text('CONFIRMER'))
                ],
              ),
            )
          ]),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
