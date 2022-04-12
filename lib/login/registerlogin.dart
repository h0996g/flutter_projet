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
                  const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
              Container(

                width: double.infinity,
                decoration: BoxDecoration(

                  color: CupitHome.get(context).dartSwitch
                      ? Colors.blueGrey
                      : Colors.blue,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(5),bottomLeft:Radius.circular(5),bottomRight: Radius.circular(15)  ),

                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: double.infinity,

                    child: MaterialButton(
                      highlightColor:CupitHome.get(context).dartSwitch
                          ? Colors.blueGrey
                          : Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Agenceregister()));
                      },
                      child: const Text(
                        'AGENCE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(

                    width: double.infinity,
                    decoration: BoxDecoration(

                      color: CupitHome.get(context).dartSwitch
                          ? Colors.blueGrey
                          : Colors.blue,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(5),bottomLeft:Radius.circular(5),bottomRight: Radius.circular(15)  ),

                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: double.infinity,

                        child:
                        MaterialButton(
                          highlightColor:CupitHome.get(context).dartSwitch
                              ? Colors.blueGrey
                              : Colors.blue,
                          onPressed: () {

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Clientregister()));
                          },
                          child: const Text(
                            'CLIENT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
