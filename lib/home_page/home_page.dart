import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 100),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF545F61),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rowWidget(
                    text: 'AC',
                    color: Colors.deepOrangeAccent,
                    callback: allClear,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: 'C',
                    color: Colors.deepOrangeAccent,
                    callback: clear,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '%',
                    color: Colors.deepOrangeAccent,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '/',
                    color: Colors.deepOrangeAccent,
                    callback: numClick,
                    buttonColor: Colors.transparent),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rowWidget(
                    text: '7',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '8',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '9',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '*',
                    color: Colors.deepOrangeAccent,
                    callback: numClick,
                    buttonColor: Colors.transparent),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rowWidget(
                    text: '4',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '5',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '6',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '-',
                    color: Colors.deepOrangeAccent,
                    callback: numClick,
                    buttonColor: Colors.transparent),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rowWidget(
                    text: '1',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '2',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '3',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '+',
                    color: Colors.deepOrangeAccent,
                    callback: numClick,
                    buttonColor: Colors.transparent),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rowWidget(
                    text: '00',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '0',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '.',
                    color: Colors.white,
                    callback: numClick,
                    buttonColor: Colors.transparent),
                rowWidget(
                    text: '=',
                    color: Colors.white,
                    callback: evaluate,
                    buttonColor: Colors.deepOrangeAccent),
              ],
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget rowWidget(
      {required Function callback,
      required String text,
      required Color color,
      required Color buttonColor}) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            callback(text);
          },
          child: Text(text, style: TextStyle(color: color, fontSize: 26)),
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(24),
          ),
        )
      ],
    );
  }
}
