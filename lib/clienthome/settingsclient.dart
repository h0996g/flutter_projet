import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/cubitHome/cupit_home.dart';
import '../home/cubitHome/homeStates.dart';
import '../login/login.dart';
import '../login/other/cachhelper.dart';

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
              'Settings',
              style: TextStyle(
                  color: CupitHome.get(context).dartSwitch
                      ? Colors.white
                      : Colors.black,
                  fontSize: 34),
            ),
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
                child: TextButton(
                  onPressed: () {
                    CachHelper.removdata(key: 'islogin').then((value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    });
                  },
                  style: TextButton.styleFrom(),
                  child: Text(
                    'SING OUT',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ]),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
