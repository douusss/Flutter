import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Math Operations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MathOperationsPage(),
    );
  }
}

class MathOperationsPage extends StatefulWidget {
  const MathOperationsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<MathOperationsPage> createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  // Controllers to get input values
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double? _additionResult;
  double? _subtractionResult;
  double? _multiplicationResult;
  double? _divisionResult;
  void _performOperations() {
    setState(() {
      // Convert input to double
      double num1 = double.tryParse(_num1Controller.text) ?? 0;
      double num2 = double.tryParse(_num2Controller.text) ?? 0;
      // Perform operations
      _additionResult = num1 + num2;
      _subtractionResult = num1 - num2;
      _multiplicationResult = num1 * num2;
      _divisionResult =
          num2 != 0 ? num1 / num2 : double.nan; // Avoid division by zero
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Math Operations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(
                labelText: 'Enter first number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _performOperations,
              child: const Text('Perform Operations'),
            ),
            const SizedBox(height: 20),
            if (_additionResult != null)
              Text('Addition Result: $_additionResult'),
            if (_subtractionResult != null)
              Text('Subtraction Result: $_subtractionResult'),
            if (_multiplicationResult != null)
              Text('Multiplication: $_multiplicationResult'),
            if (_divisionResult != null && _divisionResult!.isFinite)
              Text('Division Result: $_divisionResult'),
            if (_divisionResult != null && _divisionResult!.isNaN)
              const Text('Division: Error (Division by zero)'),
          ],
        ),
      ),
    );
  }
}
