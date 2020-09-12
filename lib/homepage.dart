import 'package:angila_bmi/calcbrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './secondpage.dart';

const Color activecolor = Color(0xFF111328);
const Color inactivecolor = Color(0xFF1D1E33);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bmiindex(),
      theme: ThemeData(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
    );
  }
}

class bmiindex extends StatefulWidget {
  @override
  _bmiindexState createState() => _bmiindexState();
}

class _bmiindexState extends State<bmiindex> {
  int height = 180;
  int weight = 50;
  int age = 15;
  Color malecolor = inactivecolor;
  Color femalecolor = inactivecolor;
  void updatecolor(int i) {
    if (i == 1) {
      if (malecolor == activecolor) {
        malecolor = inactivecolor;
      } else {
        malecolor = activecolor;
        femalecolor = inactivecolor;
      }
    } else if (i == 2) {
      if (femalecolor == activecolor) {
        femalecolor = inactivecolor;
      } else if (femalecolor == inactivecolor) {
        femalecolor = activecolor;
        malecolor = inactivecolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(1);
                    });
                  },
                  child: Design(
                      colour: malecolor,
                      custemchild: Custemchildwidget(
                        fonticon: new Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                          color: Colors.white,
                        ),
                        typevar: "Male",
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(2);
                    });
                  },
                  child: Design(
                      colour: femalecolor,
                      custemchild: Custemchildwidget(
                        fonticon: new Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                          color: Colors.white,
                        ),
                        typevar: "Female",
                      )),
                ),
              ),
            ],
          ),
          Expanded(
              child: Design(
            colour: Color(0xFF1D1E33),
            custemchild: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("HEIGHT",
                    style: new TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                        color: Colors.white70)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    new Text(height.toString(),
                        style: new TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 50.0,
                          color: Colors.white,
                        )),
                    new Text("CM",
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.0,
                          color: Colors.white,
                        ))
                  ],
                ),
                Slider(
                  activeColor: Colors.pink,
                  inactiveColor: Colors.pink[100],
                  min: 120.0,
                  max: 200.0,
                  value: height.toDouble(),
                  onChanged: (double val) {
                    setState(() {
                      height = val.round();
                    });
                  },
                ),
              ],
            ),
          )),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Design(
                  colour: Color(0xFF1D1E33),
                  custemchild: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        "Weight",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      new Text(weight.toString(),
                          style: new TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.0,
                            color: Colors.white,
                          )),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Design(
                  colour: Color(
                    0xFF1D1E33,
                  ),
                  custemchild: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        "Age",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      new Text(age.toString(),
                          style: new TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.0,
                            color: Colors.white,
                          )),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Bottombutton(
              stat: "CALCULATE",
              ontap: () {
                Calcbrain calc =
                    Calcbrain(height: height.toInt(), weight: weight.toInt());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Second_screen(
                              state: calc.getResult(),
                              bmi: calc.bmiresult(),
                              description: calc.description(),
                            )));
              })
        ],
      ),
    );
  }
}

class Bottombutton extends StatelessWidget {
  final Function ontap;
  final String stat;
  Bottombutton({@required this.ontap, @required this.stat});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: new Container(
        padding: EdgeInsets.only(bottom: 7.0),
        decoration: new BoxDecoration(
            color: Colors.pink, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: new Text(
            stat,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: 70.0,
        width: double.infinity,
      ),
    );
  }
}

class Custemchildwidget extends StatelessWidget {
  final Widget fonticon;
  final String typevar;
  Custemchildwidget({@required this.fonticon, @required this.typevar});
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        fonticon,
        SizedBox(
          height: 25,
        ),
        new Text(
          typevar,
          style: new TextStyle(fontSize: 25.0, color: Colors.white70),
        )
      ],
    );
  }
}

class Design extends StatelessWidget {
  final Color colour;
  final Widget custemchild;
  Design({@required this.colour, this.custemchild});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10.3),
        color: colour,
      ),
      height: 200,
      child: custemchild,
    );
  }
}

class RoundIcon extends StatelessWidget {
  final IconData icon;
  final Function onpressed;
  RoundIcon({@required this.icon, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      child: new Icon(icon, color: Colors.white),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
    );
  }
}
