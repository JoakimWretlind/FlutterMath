import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final maxLength;
  final String _text;

  CustomTextField({this.maxLength = 9, String text})
      : _text = (text.length > maxLength) ? text.substring(0, maxLength) : text;

  Widget languageTextField(String _correctAnswer) {
    return languageTextField(
      _correctAnswer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
      child: Container(
        constraints:
            BoxConstraints.expand(height: 60.0, width: double.infinity),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54, width: 4.0),
          borderRadius: BorderRadius.all(const Radius.circular(15.0)),
        ),
        child: Center(
          child: Text(_text,
              style: TextStyle(color: Colors.black, fontSize: 48.0)),
        ),
      ),
    );
  }
}
