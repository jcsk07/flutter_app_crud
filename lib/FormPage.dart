import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget{
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  String _email,_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email :',
                        ),
                        validator: (input)=> !input.contains('@') ? 'Not a Valid Email': null,
                        onSaved: (input)=> _email=input,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (input)=> input.length<8 ? 'You need atleast 8 characters' : null,
                        onSaved: (input)=> _password = input,
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  RaisedButton(
                              onPressed: _submit,
                              child: Text('Sign In'),
                            ),
                          )
                        ],
                      )
                    ],
                  )
              ),
            ),
        )
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pop(context),
          label: Text('Go to Page1'),
        ),
      );
  }

  void _submit(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }
}