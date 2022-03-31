// import 'package:atelier/share/component/shared_components.dart';
import 'package:agence/login/clientregister.dart';
import 'package:flutter/material.dart';

import '../home/cubitHome/cupit_home.dart';
import 'agencelogin.dart';

class Chooseregister extends StatelessWidget {
  var kekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: kekey,
              child: Column(
                children: [
                  Text(
                    'Who are you?',
                    style: TextStyle(
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.white
                          : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.white
                        : Colors.black,
                    height: 15,
                    thickness: 2,
                    indent: 80,
                    endIndent: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.blueGrey
                        : Colors.blue,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Agenceregister()));
                      },
                      child: Text(
                        'AGENCE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.blueGrey
                        : Colors.blue,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        // if (formkey.currentState!.validate()) {
                        //   print('alae ay tb3tet');
                        // Changepage(context, Navbar());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Clientregister()));
                      },
                      child: Text(
                        'CLIENT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
