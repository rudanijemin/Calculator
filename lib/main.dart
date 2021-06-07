
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart ';
// google=dart math expression


void main() {
  runApp(calculator());
}

class calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculator',

      home: simplecalculator(),
    );
  }
}

class simplecalculator extends StatefulWidget {
  @override
  _simplecalculatorState createState() => _simplecalculatorState();
}

class _simplecalculatorState extends State<simplecalculator> {
  String equation="0";
  String result="0";
  String expression="";
  double equationFontSize= 38.0;
  double resultFontSize=48;
  buttonpressed(String buttonText){
    setState(() {
      if(buttonText=="C"){

        equation ="0";
        result="0";
        double equationFontSize= 38.0;
        double resultFontSize=48;

      }else if(buttonText=="<×"){
        double equationFontSize= 48.0;
        double resultFontSize=38;
        equation=equation.substring(0,equation.length-1);
        if(equation==""){
          equation="0";
        }

      }else if(buttonText=="="){
        double equationFontSize= 48.0;
        double resultFontSize=38;

        expression=equation;
        expression=expression.replaceAll("×","*");
        expression=expression.replaceAll("÷","/");

        try{
          Parser p = new Parser();
          Expression exp=p.parse(expression);

          ContextModel cm=ContextModel();
          result='${exp.evaluate(EvaluationType.REAL,cm)}';
        }catch(e){
          result ="Error";

        }

      }else{
        double equationFontSize= 38.0;
        double resultFontSize=48;
        if(equation=="0"){
          equation=buttonText;
        }else{
          equation=equation+buttonText;
        }

      }
    });
  }


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
          onPressed: () =>buttonpressed(buttonText),
          child: Text(
            buttonText,
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
      appBar: AppBar(title: Text(" simple calculator")),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0), //left,right.top.bottom
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
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
                      children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("<×", 1, Colors.blue),
                        buildButton("÷", 1, Colors.blue),
                      ],   //symbol ke liye google---fileformat.info
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.black54),
                        buildButton("8", 1, Colors.black54),
                        buildButton("9", 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.black54),
                        buildButton("5", 1, Colors.black54),
                        buildButton("6", 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.black54),
                        buildButton("2", 1, Colors.black54),
                        buildButton("3", 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.black54),
                        buildButton("0", 1, Colors.black54),
                        buildButton("00", 1, Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
              width: MediaQuery.of(context).size.width*0.25,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      buildButton("×", 1, Colors.blue),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("-", 1, Colors.blue),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("+", 1, Colors.blue),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("=", 2, Colors.redAccent),
                    ],
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
