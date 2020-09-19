import 'package:flutter/material.dart';

class FormPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Hello Boy this is Page 2',
            textAlign: TextAlign.center
          ),
        ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pop(context),
          label: Text('Go to Page1'),
        ),
      );
  }
}