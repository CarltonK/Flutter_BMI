import 'package:flutter/material.dart';

String _indicator;
bool _indicatorBoolean = true;

bool _assignBoolean () {
  if (_indicator.toString().contains('NORMAL')) {
    _indicatorBoolean = true;
  }
  else {
    _indicatorBoolean = false;
  }
  return _indicatorBoolean;
}

class ResultBmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var resultant = ModalRoute.of(context).settings.arguments;
    String _val = _convertToMessage(resultant);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: .2,
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigo[900],
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Colors.indigo[600]),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _indicator,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _assignBoolean() ? Colors.greenAccent[700] : Colors.red,
                          letterSpacing: .5,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _val,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 130,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Normal BMI Range:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: Hero(
                tag: 'calculate',
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  color: Colors.red[400],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('RE-CALCULATE YOUR BMI',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: .2,
                        fontSize: 20,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _convertToMessage(Object resultant) {
  //Change from Object to Dictionary/Map
  var key = Map.castFrom(resultant);
  //Store in a singular variable
  var value = key['result'];
  //Change value from string to double
  var numericalValue = double.parse(value);
  //print('A double');
  //print(numericalValue);

  //Underweight
  if (numericalValue < 18.5) {
    _indicator = 'UNDERWEIGHT';
    //print('UNDERWEIGHT');
  }

  if (numericalValue >= 18.5 && numericalValue <= 24.9) {
    _indicator = 'NORMAL';
    //print('NORMAL');
  }

  if (numericalValue > 24.9 && numericalValue <= 29.9) {
    _indicator = 'OVERWEIGHT';
    //print('OVERWEIGHT');
  }

  if (numericalValue > 29.9) {
    _indicator = 'OBESE';
    //print('OBESE');
  }

  return value;
}
