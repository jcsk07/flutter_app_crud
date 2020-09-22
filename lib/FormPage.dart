import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_crud/CreateUser.dart';
import 'package:flutter_app_crud/User.dart';

class FormPage extends StatefulWidget{
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  Users _user;
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
                      ),
                      SizedBox(height: 32,),
                      if (_user == null) Container() else Text("The user ${_user.name} \n and passwords is ${_user.password}" ),
                    ],
                  ),

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

  Future<void> _submit() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(_email);
      print(_password);
      final Users user = await createUser(_email, _password);
      setState(() {
        _user = user;
      });
    }
  }
}