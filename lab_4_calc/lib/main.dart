import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Змінні зі згідно з вимогами лабораторної роботи
  String input = ''; 
  String operator = ''; 
  double previousResult = 0; 

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        clearCalculator();
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        if (input.isNotEmpty) {
          previousResult = double.parse(input);
          operator = buttonText;
          input = '';
        }
      } else if (buttonText == '=') {
        performCalculation();
      } else {
        input += buttonText;
      }
    });
  }

  void performCalculation() {
    if (operator.isNotEmpty && input.isNotEmpty) {
      double currentInput = double.parse(input);
      double result = 0;

      switch (operator) {
        case '+':
          result = previousResult + currentInput;
          break;
        case '-':
          result = previousResult - currentInput;
          break;
        case '*':
          result = previousResult * currentInput;
          break;
        case '/':
          if (currentInput == 0) {
            input = 'Помилка';
            operator = '';
            previousResult = 0;
            return;
          }
          result = previousResult / currentInput;
          break;
      }
      
      // Форматування для уникнення зайвих нулів (наприклад, 5.0 -> 5)
      input = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
      operator = '';
      previousResult = 0;
    }
  }

  void clearCalculator() {
    input = '';
    operator = '';
    previousResult = 0;
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор', style: TextStyle(color: Colors.white)), backgroundColor: Colors.black),
      body: Column(
        children: [
          // Екран виводу
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                input.isEmpty ? '0' : input,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          // Кнопки
          Column(
            children: [
              Row(
                children: [
                  buildButton('7', Colors.grey[850]!),
                  buildButton('8', Colors.grey[850]!),
                  buildButton('9', Colors.grey[850]!),
                  buildButton('/', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('4', Colors.grey[850]!),
                  buildButton('5', Colors.grey[850]!),
                  buildButton('6', Colors.grey[850]!),
                  buildButton('*', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('1', Colors.grey[850]!),
                  buildButton('2', Colors.grey[850]!),
                  buildButton('3', Colors.grey[850]!),
                  buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: [
                  buildButton('C', Colors.red[400]!),
                  buildButton('0', Colors.grey[850]!),
                  buildButton('=', Colors.green[600]!),
                  buildButton('+', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}