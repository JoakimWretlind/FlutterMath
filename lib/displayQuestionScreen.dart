import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math3b/counter.dart';
import 'package:math3b/myScaffold.dart';

import 'correctionTextField.dart';
import 'customTextField.dart';

class DisplayQuestionScreen extends StatefulWidget {
  final int sum;
  final String currentTask;
  final String buttonName;
  final Color buttonPaint;
  final Color numberPaint;

  final Function newTask;

  DisplayQuestionScreen({
    this.sum,
    this.currentTask,
    this.buttonName,
    this.newTask,
    this.buttonPaint,
    this.numberPaint,
  });

  @override
  _DisplayQuestionScreenState createState() => _DisplayQuestionScreenState();
}

class _DisplayQuestionScreenState extends State<DisplayQuestionScreen> {
  String currentTask = "";
  String correction = "";
  String userAnswer = "";
  String _answerValidationOutput = "";
  Function newTask;
  int sum;
  int score = 0;
  int _emojis = 0;
  bool _isQuestionResponded = false;
  Color correctionColor = Colors.white;
  var correct = Colors.green;
  var incorrect = Colors.red;

  @override
  void initState() {
    super.initState();
  }

  final List<String> figures = [
    '🔵',
    '🔵',
    '🔵',
    '🔵',
    '🔵',
    '🔵',
    '🔵',
    '🔵',
    '🔵',
    '🔵',
  ];

  Widget buildContainer(BuildContext context, int index) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        figures[index],
        style: TextStyle(fontSize: 17), //this is the important line
      ),
    ));
  }

  buttonPressed(String buttonText, int index) {
    if (buttonText == "<-") {
      if (!_isQuestionResponded) {
        _changeUserTypedText("");
        _changeAnswerValidationText("");
      }
    } else if (buttonText == 'OK') {
      if (userAnswer.isNotEmpty) {
        _isQuestionResponded = true;

        if (userAnswer == widget.sum.toString()) {
          setState(() {
            correction = widget.sum.toString();
            correctionColor = correct;

            figures[index] = '✔';
          });
        } else {
          setState(() {
            correction = widget.sum.toString();
            correctionColor = incorrect;
            figures[index] = '❌';
          });
        }
      }
    } else if (buttonText == 'NEXT') {
      if (correction == widget.sum.toString()) {
        widget.newTask(widget.buttonName);
        counterService.increment();
        setState(() {
          _emojis++;
        });
      } else if (correction == widget.sum.toString()) {
        widget.newTask(widget.buttonName);
      }
    } else {
      if (correction.isEmpty) {
        userAnswer = userAnswer + buttonText;
      }
    }
    setState(() {
      userAnswer = userAnswer;
    });
  }

  void _changeUserTypedText(String text) {
    setState(() => userAnswer = text);
  }

  void _changeAnswerValidationText(String text) {
    setState(() => _answerValidationOutput = text);
  }

  Widget buildButton(String buttonName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: RawMaterialButton(
          onPressed: () => setState(() => buttonPressed(buttonName, _emojis)),
          child: Text(buttonName,
              style: TextStyle(color: Colors.white, fontSize: 35.0)),
          shape: CircleBorder(),
          elevation: 8.0,
          fillColor: Colors.red,
          padding: const EdgeInsets.all(15.0),
        ),
      ),
    );
  }

  Widget buildNextButton(String buttonName) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
        child: MaterialButton(
          onPressed: () => setState(() => buttonPressed(buttonName, _emojis)),
          child: Text(
            buttonName,
            style: TextStyle(color: Colors.white, fontSize: 35.0),
          ),
          height: 50.0,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final operationField = CustomTextField(
        maxLength: 9, text: "${widget.currentTask + userAnswer}");
    final correctionField = CorrectionTextField(
      boxPaint: correctionColor,
      text: correction,
    );

    return MyScaffold(
      scaffoldTitle: ('Score ${score} / 10'),
      body: Column(
        children: [
          operationField,
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildContainer(context, 0),
                        buildContainer(context, 1),
                        buildContainer(context, 2),
                        buildContainer(context, 3),
                        buildContainer(context, 4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildContainer(context, 5),
                        buildContainer(context, 6),
                        buildContainer(context, 7),
                        buildContainer(context, 8),
                        buildContainer(context, 9),
                      ],
                    ),
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: correctionField,
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Expanded(child: Divider()),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildKeyboard() {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          buildButton('1'),
          buildButton('2'),
          buildButton('3'),
        ],
      ),
      Row(
        children: <Widget>[
          buildButton('4'),
          buildButton('5'),
          buildButton('6'),
        ],
      ),
      Row(
        children: <Widget>[
          buildButton('7'),
          buildButton('8'),
          buildButton('9'),
        ],
      ),
      Row(
        children: <Widget>[
          buildButton('<-'),
          buildButton('0'),
          buildButton('OK'),
        ],
      ),
      Row(
        children: <Widget>[
          buildNextButton('NEXT'),
        ],
      ),
    ]);
  }
}
