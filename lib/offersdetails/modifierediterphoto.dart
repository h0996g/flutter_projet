import 'dart:io';

import 'package:agence/offersdetails/CubitOfferDetailState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubitOfferDetail.dart';

class Modifierediterphoto extends StatelessWidget {
   Modifierediterphoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitDetail, DetailStates>(
        builder: (BuildContext context, state) {
          return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Modifier les images',
                  style: TextStyle(fontSize: 40, color: Colors.red[300]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: CubitDetail.get(context).imageFileList!.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.file(
                              File(CubitDetail.get(context)
                                  .imageFileList![index]
                                  .path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    CubitDetail.get(context).removephoto(index);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ))
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        );},
      listener: (BuildContext context, Object? state) {},
    );
  }
}
