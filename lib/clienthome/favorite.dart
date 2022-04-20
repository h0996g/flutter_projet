import 'package:flutter/material.dart';

import '../home/cubitHome/cupit_home.dart';

class Favorite extends StatelessWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        title: Text(
          'Favorite',
          style: TextStyle(
              color: CupitHome.get(context).dartSwitch
                  ? Colors.white
                  : Colors.black,
              fontSize: 34),
        ),
      ),
      body: const Center(
        child: Icon(
          Icons.favorite_sharp,
          size: 100,
          color: Colors.grey,
        ),
      ),
    );
  }
}
