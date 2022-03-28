
// import 'package:atelier/share/component/shared_components.dart';
import 'package:flutter/material.dart';

import '../home/cubitHome/cupit_home.dart';

class Chooseregister extends StatelessWidget {

  var kekey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:kekey ,
              child: Column(
                children:  [

                  Text('Who are you?',style: TextStyle( color: Colors.blueGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,),),
                  SizedBox(height: 20,),
                  Container(
                    color:  CupitHome.get(context).dartSwitch
                        ? Colors.blueGrey
                        : Colors.blue,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        // if (formkey.currentState!.validate()) {
                        //   print('alae ay tb3tet');
                        // Changepage(context, Navbar());
                      }
                      ,
                      child: Text(
                        'AGENCE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    color:  CupitHome.get(context).dartSwitch
                        ? Colors.blueGrey
                        : Colors.blue,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        // if (formkey.currentState!.validate()) {
                        //   print('alae ay tb3tet');
                        // Changepage(context, Navbar());
                      }
                      ,
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