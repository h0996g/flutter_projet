import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        title: Text(
          'Add Post',
          style: Theme.of(context).textTheme.headline4,
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
