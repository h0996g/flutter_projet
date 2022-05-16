import 'dart:io';

import 'package:agence/home/home.dart';
import 'package:agence/home/modifierprofile/cubitmodifier.dart';
import 'package:agence/home/modifierprofile/modifierstate.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/components/components.dart';
import 'cupit_home.dart';
import 'homeStates.dart';

class Modifierprofile extends StatefulWidget {
  Modifierprofile({Key? key}) : super(key: key);

  @override
  State<Modifierprofile> createState() => _ModifierprofileState();
}

class _ModifierprofileState extends State<Modifierprofile> {
  CupitHome? objHome;
  CubitModifier? objModifier;
  var namemodController = TextEditingController();
  var addressemodController = TextEditingController();
  // var passmodController = TextEditingController();
  var numbermodController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Map<String, dynamic> sendinfoagencemodifier = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    objHome = BlocProvider.of(context);
    objModifier = BlocProvider.of(context);
    namemodController =
        TextEditingController(text: objHome?.getinfouserModel!.name);
    addressemodController =
        TextEditingController(text: objHome!.getinfouserModel!.agence!.address);
    //  passmodController = TextEditingController();
    numbermodController =
        TextEditingController(text: objHome!.getinfouserModel!.phone);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitModifier, ModifierStates>(
        builder: (BuildContext context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              // FocusScope.of(context).unfocus();
              CupitHome.get(context).currentindex = 2;
              Changepage(context, const Home());
            },
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 10,
          title: Text('Modifier Profile',
              style: Theme.of(context).textTheme.headline4),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 70,
                    // backgroundImage: CubitModifier.get(context).imagecamera==null ? AssetImage('assets/images/design.png') : Image.file(File(CubitModifier.get(context).imagecamera!.path)).image ,
                    backgroundImage: CubitModifier.get(context)
                                .selectedImages ==
                            null
                        ? const AssetImage('assets/images/profile_avatar.jpg')
                        : Image.file(File(CubitModifier.get(context)
                                .selectedImages!
                                .path))
                            .image,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextButton(
                      onPressed: () {
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
                                        CubitModifier.get(context)
                                            .selectimagecameramodifier();
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
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        CubitModifier.get(context)
                                            .selectImagesGalerymodifier();
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
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Text(
                        'Ajouter photo',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      )),

                  const SizedBox(
                    height: 14,
                  ),
                  defaultForm(
                      context: context,
                      controller: namemodController,
                      type: TextInputType.text,
                      lable: Text(
                        'nom',
                        style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey),
                      ),
                      valid: (String value) {
                        if (value.isEmpty) {
                          return 'name Must Not Be Empty';
                        }
                      },
                      onFieldSubmitted: () {},
                      prefixIcon: Icon(
                        Icons.person,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      ),
                      textInputAction: TextInputAction.next),
                  const SizedBox(
                    height: 22,
                  ),

                  defaultForm(
                      context: context,
                      // valeurinitial: ala,
                      controller: addressemodController,
                      type: TextInputType.text,
                      lable: Text(
                        'addresse',
                        style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey),
                      ),
                      valid: (String value) {
                        if (value.isEmpty) {
                          return 'addresse Must Not Be Empty';
                        }
                      },
                      onFieldSubmitted: () {},
                      prefixIcon: Icon(
                        Icons.place,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      ),
                      textInputAction: TextInputAction.next),

                  const SizedBox(
                    height: 22,
                  ),
                  // defaultForm(
                  //
                  //     context: context,
                  //     textInputAction: TextInputAction.done,
                  //     controller: passmodController,
                  //     type: TextInputType.visiblePassword,
                  //     onFieldSubmitted: () {
                  //
                  //     },
                  //     obscureText: CubitModifier.get(context).ishiddens,
                  //     valid: (value) {
                  //       if (value.isEmpty) {
                  //         return 'Password Must Be Not Empty';
                  //       }
                  //     },
                  //     lable: Text(
                  //       'Password',
                  //       style: TextStyle(
                  //           color: CupitHome.get(context).dartSwitch
                  //               ? Colors.white
                  //               : Colors.grey),
                  //     ),
                  //     prefixIcon: Icon(
                  //       Icons.password,
                  //       color: CupitHome.get(context).dartSwitch
                  //           ? Colors.white
                  //           : Colors.grey,
                  //     ),
                  //     sufixIcon: IconButton(
                  //       onPressed: () {
                  //         CubitModifier.get(context).showpasse();
                  //       },
                  //       icon: CubitModifier.get(context).iconhiddens,
                  //       color: CupitHome.get(context).dartSwitch
                  //           ? Colors.white
                  //           : Colors.grey,
                  //     )),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  defaultForm(
                    context: context,
                    controller: numbermodController,
                    type: TextInputType.number,
                    lable: Text(
                      'number',
                      style: TextStyle(
                          color: CupitHome.get(context).dartSwitch
                              ? Colors.white
                              : Colors.grey),
                    ),
                    valid: (String value) {
                      if (value.isEmpty) {
                        return 'number Must Not Be Empty';
                      }
                    },
                    onFieldSubmitted: () {},
                    prefixIcon: Icon(
                      Icons.phone,
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.white
                          : Colors.grey,
                    ),
//      textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ConditionalBuilder(
                    condition: state is! ModifierConditionalLodinState,
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CupitHome.get(context).dartSwitch
                              ? Colors.blueGrey
                              : Colors.blue,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            width: double.infinity,
                            child: MaterialButton(
                              highlightColor: CupitHome.get(context).dartSwitch
                                  ? Colors.blueGrey
                                  : Colors.blue,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  sendinfoagencemodifier = {
                                    'name': namemodController.text,

                                    // 'password': passmodController.text,
                                    'phone': numbermodController.text,
                                    'address': addressemodController.text
                                  };
                                  objModifier!
                                      .updateAgence(sendinfoagencemodifier);
                                }
                              },
                              child: const Text(
                                'MODIFIER',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    fallback: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, listener: (BuildContext context, Object? state) {
      if (state is GoodUpdateAgenceInfoState) {
        // CupitHome.get(context).getinfouserModel = null;
        CupitHome.get(context).getinformationAgenceOrClient().then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (route) => false);
          Fluttertoast.showToast(
              msg: 'Updates Successfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        });
        //   var then = CachHelper.removdata(key: 'token').then((value) {
        //     print(TOKEN);
        //     TOKEN = '';
        //     Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(builder: (context) => LoginScreen()),
        //             (route) => false);
        //   });
        //   Fluttertoast.showToast(
        //       msg: 'déconnexion réussie',
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.green,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        // } else if (state is LougOutBadState) {
        //   Fluttertoast.showToast(
        //       msg: 'There\'s a problem',
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        // }
      } else if (state is BadUpdateAgenceInfoState) {
        Fluttertoast.showToast(
            msg: 'There\'s a problem',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }
}
