import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OperationButton(
              label: 'Addition',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdditionPage()),
                );
              },
            ),
            OperationButton(
              label: 'Subtraction',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubtractionPage()),
                );
              },
            ),
            OperationButton(
              label: 'Multiplication',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MultiplicationPage()),
                );
              },
            ),
            OperationButton(
              label: 'Division',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DivisionPage()),
                );
              },
            ),
            OperationButton(
              label: 'Root',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RootPage()),
                );
              },
            ),
            OperationButton(
              label: 'Exponentiation',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExponentiationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OperationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const OperationButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class OperationPage extends StatelessWidget {
  final String title;
  final Widget operationWidget;

  OperationPage({required this.title, required this.operationWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: operationWidget,
    );
  }
}

class OperationInputPage extends StatelessWidget {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();

  final void Function(double, double) onOperationPerform;

  OperationInputPage({required this.onOperationPerform});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: firstNumberController,
          decoration: InputDecoration(labelText: 'First Number'),
        ),
        TextField(
          controller: secondNumberController,
          decoration: InputDecoration(labelText: 'Second Number'),
        ),
        ElevatedButton(
          onPressed: () {
            final double firstNumber =
                double.tryParse(firstNumberController.text) ?? 0.0;
            final double secondNumber =
                double.tryParse(secondNumberController.text) ?? 0.0;
            onOperationPerform(firstNumber, secondNumber);
          },
          child: Text('OK'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ],
    );
  }
}

class AdditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationPage(
      title: 'Addition',
      operationWidget: OperationInputPage(
        onOperationPerform: (double firstNumber, double secondNumber) {
          final double result = firstNumber + secondNumber;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Result'),
                content: Text('The result of addition is $result'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class SubtractionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationPage(
      title: 'Subtraction',
      operationWidget: OperationInputPage(
        onOperationPerform: (double firstNumber, double secondNumber) {
          final double result = firstNumber - secondNumber;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Result'),
                content: Text('The result of subtraction is $result'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class MultiplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationPage(
      title: 'Multiplication',
      operationWidget: OperationInputPage(
        onOperationPerform: (double firstNumber, double secondNumber) {
          final double result = firstNumber * secondNumber;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Result'),
                content: Text('The result of multiplication is $result'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class DivisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationPage(
      title: 'Division',
      operationWidget: OperationInputPage(
        onOperationPerform: (double firstNumber, double secondNumber) {
          if (secondNumber == 0) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Division by zero is not allowed'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
            return;
          }
          final double result = firstNumber / secondNumber;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Result'),
                content: Text('The result of division is $result'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationPage(
      title: 'Root',
      operationWidget: OperationInputPage(
        onOperationPerform: (double number1, double number2) {
          // Perform root operation
        },
      ),
    );
  }
}

class ExponentiationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationPage(
      title: 'Exponentiation',
      operationWidget: OperationInputPage(
        onOperationPerform: (double base, double exponent) {
          final double result = calculateExponentiation(base, exponent);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Result'),
                content: Text('The result of exponentiation is $result'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  double calculateExponentiation(double base, double exponent) {
    if (exponent < 0) {
      return double.nan;
    }
    double result = 1;
    for (int i = 0; i < exponent.toInt(); i++) {
      result *= base;
    }
    return result;
  }
}
