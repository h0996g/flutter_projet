import 'package:agence/home/modifierprofile/modifierpasswordclient.dart';
import 'package:agence/home/modifierprofile/modifierprofileclient.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Api/constApi.dart';
import '../home/cubitHome/cupit_home.dart';
import '../home/cubitHome/homeStates.dart';
import '../home/cubitHome/modifierprofileagence.dart';
import '../home/modifierprofile/modifierpasswordagence.dart';
import '../login/login.dart';
import '../login/other/cachhelper.dart';
import '../shared/components/components.dart';

class Settingsclient extends StatelessWidget {
  Settingsclient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 5,
            title: Text(
              'Profile',
              style: TextStyle(
                  color: CupitHome.get(context).dartSwitch
                      ? Colors.white
                      : Colors.black,
                  fontSize: 34),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    CupitHome.get(context).changeSwitch(
                        value: !CupitHome.get(context).dartSwitch);
                  },
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),

                  Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('assets/images/profile_avatar.jpg'),
                    ),
                  ]),

                  const SizedBox(
                    height: 9,
                  ),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Modifierprofileclient()));
                              },
                              child: const Text(
                                'Modifier profile',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                          const SizedBox(
                            width: 1,
                          ),
                          Text(
                            '/',
                            style: TextStyle(
                              color: CupitHome.get(context).dartSwitch
                                  ? Colors.blueGrey
                                  : Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Modifierpasswordclient()));
                              },
                              child: const Text(
                                'Modifier password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ]),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Boulrens",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        // SizedBox(width: 10,)
                      ],
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.blueGrey
                          : Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Ala eddine",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.blueGrey
                          : Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "077640169",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.blueGrey
                          : Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Row(
                  //   children: [
                  //     const Text(
                  //       'Dark Mode',
                  //       style: TextStyle(color: Colors.grey, fontSize: 18),
                  //     ),
                  //     const Spacer(),
                  //     Expanded(
                  //       child: SwitchListTile.adaptive(
                  //         onChanged: (value) {
                  //           CupitHome.get(context).changeSwitch(value: value);
                  //         },
                  //         value: CupitHome.get(context).dartSwitch,
                  //         activeColor: Colors.black26,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.alternate_email,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "alaeddine1305@gmail.com",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.blueGrey
                          : Colors.blue,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ConditionalBuilder(
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
                                highlightColor:
                                    CupitHome.get(context).dartSwitch
                                        ? Colors.blueGrey
                                        : Colors.blue,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  CupitHome.get(context).logOut();
                                },
                                child: const Text(
                                  'DÉCONNEXION',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      condition: state is! ConditionalLodinState,
                      fallback: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is LougOutSuccesState) {
          CachHelper.removdata(key: 'token').then((value) {
            print(TOKEN);
            TOKEN = '';
            // CupitHome.get(context).dataOfferModel = null;
            CupitHome.get(context).getinfouserModel = null;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          });
          Fluttertoast.showToast(
              msg: 'déconnexion réussie',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is LougOutBadState) {
          Fluttertoast.showToast(
              msg: 'There\'s a problem',
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






















// Center(
// child: TextButton(
// onPressed: () {
// CachHelper.removdata(key: 'islogin').then((value) {
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (context) => LoginScreen()),
// (route) => false);
// });
// },
// style: TextButton.styleFrom(),
// child: Text(
// 'SING OUT',
// style: Theme.of(context).textTheme.headline4,
// ),
// ),
// ),