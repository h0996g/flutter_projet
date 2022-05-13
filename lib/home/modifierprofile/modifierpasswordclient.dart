import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../clienthome/navbar.dart';
import '../../login/cupitlogin/loginStates.dart';
import '../../shared/components/components.dart';
import '../cubitHome/cupit_home.dart';
import 'cubitmodifier.dart';
import 'modifierstate.dart';

class Modifierpasswordclient extends StatelessWidget {
  Modifierpasswordclient({Key? key}) : super(key: key);

  var passmodControllerr = TextEditingController();
  var passmodControllerneww = TextEditingController();
  var passmodControllerverificationn = TextEditingController();
  var formKeyyyyyz = GlobalKey<FormState>();
  Map<String, dynamic> sendinfoclientmodifierpassword = {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitModifier, ModifierStates>(
        builder: (BuildContext context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              // FocusScope.of(context).unfocus();
              CupitHome.get(context).currentindex = 2;
              Changepage(context, const Navbar());
            },
            icon: Icon(Icons.arrow_back),
          ),
          elevation: 10,
          title: Text('Modifier Mdps',
              style: Theme.of(context).textTheme.headline4),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKeyyyyyz,
              child: Column(
                children: [
                  defaultForm(
                      context: context,
                      textInputAction: TextInputAction.done,
                      controller: passmodControllerr,
                      type: TextInputType.visiblePassword,
                      onFieldSubmitted: () {},
                      obscureText: CubitModifier.get(context).ishiddens,
                      valid: (value) {
                        if (value.isEmpty) {
                          return 'Password Must Be Not Empty';
                        }
                      },
                      lable: Text(
                        'Old Password',
                        style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey),
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {
                          CubitModifier.get(context).showpasse();
                        },
                        icon: CubitModifier.get(context).iconhiddens,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultForm(
                      context: context,
                      textInputAction: TextInputAction.done,
                      controller: passmodControllerneww,
                      type: TextInputType.visiblePassword,
                      onFieldSubmitted: () {},
                      obscureText: CubitModifier.get(context).ishiddenss,
                      valid: (value) {
                        if (value.isEmpty) {
                          return 'Password Must Be Not Empty';
                        }
                      },
                      lable: Text(
                        'New Password',
                        style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey),
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {
                          CubitModifier.get(context).showpasses();
                        },
                        icon: CubitModifier.get(context).iconhiddenss,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultForm(
                      context: context,
                      textInputAction: TextInputAction.done,
                      controller: passmodControllerverificationn,
                      type: TextInputType.visiblePassword,
                      onFieldSubmitted: () {},
                      obscureText: CubitModifier.get(context).ishiddensss,
                      valid: (value) {
                        if (value.isEmpty) {
                          return 'Password Must Be Not Empty';
                        }
                      },
                      lable: Text(
                        'New Password',
                        style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey),
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      ),
                      sufixIcon: IconButton(
                        onPressed: () {
                          CubitModifier.get(context).showpassess();
                        },
                        icon: CubitModifier.get(context).iconhiddensss,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! ConditionalLodinState,
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
                                if (formKeyyyyyz.currentState!.validate()) {
                                  sendinfoclientmodifierpassword = {
                                    'password': passmodControllerr.text,
                                    'new password': passmodControllerneww.text,
                                    'new password two':
                                        passmodControllerverificationn.text,
                                  };
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
      //   if (state is LougOutSuccesState) {
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
    });
  }
}
