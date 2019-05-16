import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homePage.dart';


void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'math3b',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}
