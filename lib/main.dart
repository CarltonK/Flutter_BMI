import 'package:complete_guide/screens/result_bmi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Main Page - FirstMaxApp()
//Secondary Page - ResultBmi
void main() => runApp(FirstMaxApp());

//Called when runApp above runs
//Must return a Widget, else you get an initial route error
class FirstMaxApp extends StatefulWidget {
  @override
  _FirstMaxAppState createState() => _FirstMaxAppState();
}

class _FirstMaxAppState extends State<FirstMaxApp> {
  var _rating = 177.0;
  var _weight = 84;
  var _age = 23;

  String _calculateBMI(_rating, _weight) {
    double _heightInMetres = _rating / 100;
    double _heightInMetresSquared = _heightInMetres * _heightInMetres;
    double _bmiRating = _weight / _heightInMetresSquared;
    String resultant = _bmiRating.toStringAsFixed(1);
    return resultant;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/result': (context) => ResultBmi(),
      },
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo[900],
            elevation: 0.0,
            leading: Icon(
              Icons.subject,
              size: 26,
            ),
            title: Text(
              'BMI CALCULATOR',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: .2,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.indigo[900],
          body: SafeArea(
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30.0, 0, 5.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: Colors.indigo[600]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      child: Image.asset('assets/male.png'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(5.0, 0, 30.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: Colors.indigo[600]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      child: Image.asset('assets/woman.png'),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          color: Colors.indigo[600]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'HEIGHT',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: _rating.toStringAsFixed(0),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1)),
                              TextSpan(
                                  text: 'cm',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                      letterSpacing: .2)),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Slider(
                            activeColor: Colors.white,
                            value: _rating,
                            min: 120,
                            max: 220,
                            onChanged: (newRating) {
                              setState(() => _rating = newRating);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 10.0, 5.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: Colors.indigo[600]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'WEIGHT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 20,
                                      ),
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: _weight.toStringAsFixed(0),
                                            style: TextStyle(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1)),
                                        TextSpan(
                                            text: 'kg',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 20,
                                                letterSpacing: .2)),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo[900],
                                                shape: BoxShape.circle),
                                            child: IconButton(
                                              color: Colors.white,
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  _weight--;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo[900],
                                                shape: BoxShape.circle),
                                            child: IconButton(
                                              color: Colors.white,
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  _weight++;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  5.0, 10.0, 30.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: Colors.indigo[600]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'AGE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      _age.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo[900],
                                                shape: BoxShape.circle),
                                            child: IconButton(
                                              color: Colors.white,
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  _age--;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo[900],
                                                shape: BoxShape.circle),
                                            child: IconButton(
                                              color: Colors.white,
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  _age++;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 80,
                      width: double.maxFinite,
                      child: Hero(
                        tag: 'calculate',
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          color: Colors.red[400],
                          onPressed: () {
                            var resultant = _calculateBMI(_rating, _weight);
                            print(resultant);
                            //We need to pass the result to the next route
                            Navigator.pushNamed(context, '/result',
                                arguments: {'result': resultant});
                          },
                          child: Text('CALCULATE YOUR BMI',
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
            ),
          ),
        ),
      ),
    );
  }
}
