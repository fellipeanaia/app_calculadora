import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String textDisplay = '0';
  late int firstNumber;
  late String operation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculadora')),
      ),
      body: Column(
        children: [
          _display(),
          _keyboard(),
        ],
      ),
    );
  }

  Widget _keyboard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('/'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('*'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('-'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('C'),
            _buildButton('0'),
            _buildButton('='),
            _buildButton('+'),
          ],
        )
      ],
    );
  }

  Container _buildButton(String name) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              switch (name) {
                case '/':
                  operation = '/';
                  firstNumber = int.parse(textDisplay);
                  textDisplay = '';
                  break;
                case '*':
                  operation = '*';
                  firstNumber = int.parse(textDisplay);
                  textDisplay = '';
                  break;
                case '-':
                  operation = '-';
                  firstNumber = int.parse(textDisplay);
                  textDisplay = '';
                  break;
                case '+':
                  operation = '+';
                  firstNumber = int.parse(textDisplay);
                  textDisplay = '';
                  break;
                case '=':
                  _calculate(int.parse(textDisplay));
                  break;
                case 'C':
                  firstNumber = 0;
                  textDisplay = '0';
                  break;
                default:
                  textDisplay = textDisplay + name;
                  int removeZero = int.parse(textDisplay);
                  textDisplay = removeZero.toString();
              }
            });
          },
          child: Text(name)),
    );
  }

  Widget _display() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      alignment: Alignment.centerRight,
      child: Text(
        textDisplay,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }

  void _calculate(int secondNumber) {
    switch (operation) {
      case '/':
        double result = firstNumber / secondNumber;
        textDisplay = result.toString();
        break;
      case '*':
        int result = firstNumber * secondNumber;
        textDisplay = result.toString();
        break;
      case '-':
        int result = firstNumber - secondNumber;
        textDisplay = result.toString();
        break;
      case '+':
        int result = firstNumber + secondNumber;
        textDisplay = result.toString();
        break;
    }
  }
}
