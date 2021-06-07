import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(calculator());
}

class calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculator',
      theme: ThemeData(primarySwatch: Colors.black),
      home: simplecalculator(),
    );
  }
}

class simplecalculator extends StatefulWidget {
  @override
  _simplecalculatorState createState() => _simplecalculatorState();
}

class _simplecalculatorState extends State<simplecalculator> {
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1*buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: null,
          child: Text(
            buttonText,7
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" calculator")),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0), //left,right.top.bottom
            child: Text(
              "0",
              style: TextStyle(fontSize: 38),
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 48),
            ),
          ),
          //divied screen in a half =first half at top....and second half at bottom.
          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
