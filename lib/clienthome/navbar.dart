
import 'package:agence/home/cubitHome/homeStates.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/cubitHome/cupit_home.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // List<Widget> screens= [
  //   Offersclient(),
  //   Favorite(),
  //   Settingsclient(),
  // ];
  // int currentindex=0;
  // List<String> text =['offers',
  //   'add offer',
  //   'profile',
  // ];
  @override
  Widget build(BuildContext context) {
    CupitHome obj = BlocProvider.of(context);
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: obj.bodyy[obj.currentindexa],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Offers'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Profile'),
            ],
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            currentIndex: obj.currentindexa,
            onTap: (value) {
              obj.changenavbar(value);
            },
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
