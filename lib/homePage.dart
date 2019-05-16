import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'displayQuestionScreen.dart';
import 'myScaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final random = Random();

  int val1, val2, val3, val4, val5, val6;
  int min1 = 10, min2 = 21;
  int max1 = 21, max2 = 101;

  String currentTask;
  int sum;

  bool easy = true;
  bool average = false;
  bool hard = false;

  void createTask(String buttonName) {
    setState(() {
      if (buttonName == '+') {
        createAddition(buttonName, bool);
      } else if (buttonName == '-') {
        createSubtraction(buttonName, bool);
      } else if (buttonName == '10') {
        print('10');
      } else if (buttonName == 'x') {
        print('gånger');
      } else if (buttonName == '/') {
        print('delat');
      }
      setState(() {
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DisplayQuestionScreen(
              sum: sum,
              buttonName: buttonName,
              newTask: createTask,
              currentTask: currentTask,
            )));
      });
    });
  }

  void createAddition(String buttonName, bool) {
    setState(() {
      val1 = random.nextInt(11);
      val2 = random.nextInt(11);

      val3 = min1 + random.nextInt(max1 - min1);
      val4 = min1 + random.nextInt(max1 - min1);
      val5 = min2 + random.nextInt(max2 - min2);
      val6 = min2 + random.nextInt(max2 - min2);

      if (easy == true) {
        sum = val1 + val2;
        currentTask = '$val1+$val2=';
      } else if (average == true) {
        sum = val3 + val4;
        currentTask = '$val3+$val4=';
      } else if (hard == true) {
        sum = val5 + val6;
        currentTask = '$val5+$val6=';
      }

      navigate(buttonName, bool);
    });
  }

  void createSubtraction(String buttonName, bool) {
    setState(() {
      val1 = random.nextInt(11);
      val2 = random.nextInt(11);

      val3 = min1 + random.nextInt(max1 - min1);
      val4 = min1 + random.nextInt(max1 - min1);
      val5 = min2 + random.nextInt(max2 - min2);
      val6 = min2 + random.nextInt(max2 - min2);

      if (easy == true) {
        if (val1 >= val2) {
          sum = val1 - val2;
          currentTask = '$val1-$val2=';
        } else {
          sum = val2 - val1;
          currentTask = '$val2-$val1=';
        }
      } else if (average == true) {
        sum = val3 - val1;
        currentTask = '$val3-$val1=';
      } else if (hard == true) {
        if (val5 >= val6) {
          sum = val5 - val6;
          currentTask = '$val5-$val6=';
        } else {
          sum = val6 - val5;
          currentTask = '$val6-$val5=';
        }
      }
      navigate(buttonName, bool);
    });
  }

  void navigate(String buttonName, bool) {
    setState(() {
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DisplayQuestionScreen(
            sum: sum,
            //            buttonName: buttonName,
            newTask: createTask,
            currentTask: currentTask,
          )));
    });
  }

  Widget checkbox(String checkboxTitle, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(checkboxTitle),
        Checkbox(
          value: boolValue,
          onChanged: (boolValue) {
            setState(() {
              switch (checkboxTitle) {
                case 'Easy':
                  easy = true;
                  average = false;
                  hard = false;
                  break;
                case 'Average':
                  easy = false;
                  average = true;
                  hard = false;
                  break;
                case 'Hard':
                  easy = false;
                  average = false;
                  hard = true;
                  break;
              }
            });
          },
        ),
      ],
    );
  }

  Widget raisedButton(String buttonName) {
    return RaisedButton(
      child: Text(buttonName),
      onPressed: () => createTask(buttonName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      scaffoldTitle: 'HOMESCREEN',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              checkbox('Easy', easy),
              checkbox('Average', average),
              checkbox('Hard', hard),
            ],
          ),
          raisedButton('+'),
          raisedButton('-'),
          raisedButton('10'),
          raisedButton('x'),
          raisedButton('/')
        ],
      ),
    );
  }
}
