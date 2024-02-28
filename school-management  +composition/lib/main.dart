import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Department Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DepartmentForm(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class DepartmentForm extends StatefulWidget {
  @override
  _DepartmentFormState createState() => _DepartmentFormState();
}

class _DepartmentFormState extends State<DepartmentForm> {
  TextEditingController departmentNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void _showAlert(String name, String lastName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogBox(name: name, lastName: lastName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Department',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: departmentNameController,
              decoration: InputDecoration(
                hintText: 'Enter Department Name',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Name',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Lastname',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                hintText: 'Enter Lastname',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _showAlert(nameController.text, lastNameController.text);
                setState(() {
                  nameController.clear();
                  lastNameController.clear();
                });
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertDialogBox extends StatelessWidget {
  final String name;
  final String lastName;

  const AlertDialogBox({
    required this.name,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Entered Details:'),
      content: Text('Name: $name\nLast Name: $lastName'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
