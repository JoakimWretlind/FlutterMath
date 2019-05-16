import 'package:flutter/material.dart';

class CorrectionTextField extends StatelessWidget {
  final String text;
  final boxPaint;

  CorrectionTextField({this.text, this.boxPaint = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 8.0),
      child: Container(
        constraints: BoxConstraints.expand(height: 60.0, width: 150),
        decoration: BoxDecoration(
          color: boxPaint,
          borderRadius: BorderRadius.all(const Radius.circular(15.0)),
          border: Border.all(color: Colors.black54, width: 4.0),
        ),
        child: Center(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 48.0)),
        ),
      ),
    );
  }
}
