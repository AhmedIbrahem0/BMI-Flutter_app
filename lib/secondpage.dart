import 'package:angila_bmi/homepage.dart';
import 'package:flutter/material.dart';

class Second_screen extends StatelessWidget {
  final String state;
  final String bmi;
  final String description;
  Second_screen(
      {@required this.state, @required this.bmi, @required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0, left: 15.0),
                alignment: Alignment.bottomLeft,
                child: new Text(
                  "Your Result",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            new Expanded(
              flex: 5,
              child: Design(
                colour: Color(0xFF1D1E33),
                custemchild: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Text(
                      state,
                      style: new TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      bmi,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 100.0),
                    ),
                    new Text(
                      description,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Bottombutton(
              stat: "Re-Calculate",
              ontap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
