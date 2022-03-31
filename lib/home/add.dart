import 'package:flutter/material.dart';

import 'cubitHome/cupit_home.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        title: Text(
          'Add Offer',
          style: TextStyle(color:  CupitHome.get(context).dartSwitch
              ? Colors.white
              : Colors.black,
          fontSize: 34),
        ),
      ),
      body: const Center(
        child: Icon(
          Icons.add_business,
          size: 100,
          color: Colors.grey,
        ),
      ),
    );
  }
}
