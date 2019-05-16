import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {

  final body;
  final scaffoldTitle;

  MyScaffold({this.body, this.scaffoldTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(scaffoldTitle,
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
