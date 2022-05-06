import 'package:agence/Api/constApi.dart';

import 'package:agence/login/other/cachhelper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../login/login.dart';
import 'cubitHome/cupit_home.dart';
import 'cubitHome/homeStates.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.headline4,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    CupitHome.get(context).changeSwitch(value: !CupitHome.get(context).dartSwitch);
                  },
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  )),

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Account',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    'Change Password',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    'Notifications',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    'Language',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const Spacer(),
                  Expanded(
                    child: SwitchListTile.adaptive(
                      onChanged: (value) {
                        CupitHome.get(context).changeSwitch(value: value);
                      },
                      value: CupitHome.get(context).dartSwitch,
                      activeColor: Colors.black26,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Center(
                child: ConditionalBuilder(
                  builder: (BuildContext context) {
                    return TextButton(
                      onPressed: () {
                        CupitHome.get(context).logOut();
                      },
                      style: TextButton.styleFrom(),
                      child: Text(
                        'SING OUT',
                        style: Theme.of(context).textTheme.headline4,
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
                height: 50,
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
