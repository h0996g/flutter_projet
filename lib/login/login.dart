import 'package:agence/home/home.dart';
import 'package:agence/login/cupitlogin/cupitl.dart';
import 'package:agence/login/cupitlogin/statesh.dart';
import 'package:agence/login/other/cachhelper.dart';
import 'package:agence/login/registerlogin.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home/cubitHome/cupit_home.dart';
import '../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      defaultForm(
                          context: context,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          lable: Text(
                            'Email',
                            style: TextStyle(
                                color: CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          valid: (String value) {
                            if (value.isEmpty) {
                              return 'Email Must Not Be Empty';
                            }
                          },
                          onFieldSubmitted: () {},
                          prefixIcon: Icon(
                            Icons.email,
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey,
                          ),
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: 18,
                      ),
                      defaultForm(
                          context: context,
                          textInputAction: TextInputAction.done,
                          controller: passController,
                          type: TextInputType.visiblePassword,
                          onFieldSubmitted: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).login(
                                  pass: passController.text,
                                  email: emailController.text);
                            }
                          },
                          obscureText: LoginCubit.get(context).ishidden,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Password Must Be Not Empty';
                            }
                          },
                          lable: Text(
                            'Password',
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
                              LoginCubit.get(context).showpass();
                            },
                            icon: LoginCubit.get(context).iconhidden,
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey,
                          )),
                      SizedBox(
                        height: 18,
                      ),
                      ConditionalBuilder(
                        condition: state is! ConditionalLodinState,
                        builder:(BuildContext context){ return Container(

                           color:  CupitHome.get(context).dartSwitch
                               ? Colors.blueGrey
                               : Colors.blue,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).login(
                                    pass: passController.text,
                                    email: emailController.text);
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );}, fallback: (BuildContext context) { return const Center(
                        child: CircularProgressIndicator(),
                      ); },
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'dont have account?',
                            style: TextStyle(

                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Chooseregister()));
                          }, child: Text('Register'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is GoodLoginState) {
          if (state.mod.status) {
            CachHelper.putcache(key: 'islogin', value: state.mod.data?.token)
                .then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false);
            }).then((value) {
              Fluttertoast.showToast(
                  msg: state.mod.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          } else {
            Fluttertoast.showToast(
                msg: state.mod.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
    );
  }
}
