import 'dart:convert';
import 'dart:developer';

import 'User.dart';
import 'package:http/http.dart' as http;


// ignore: missing_return
Future <Users> createUser(String name, String password) async {
  Map<String,String> data = {
    'name' : name,
    'password': password
  };
  final String url = "http://192.168.31.36/flutterConnections/PostData.php";
  final String _body = json.encode(data);
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: _body,
  );
  if(response.statusCode==200){
    log("request submitted successfully");
    log(response.body);
    Users user;
    user.name = name;
    user.password = password;
    return user;
  }else{
    log("request submission failed please check once");
    return null;
  }
}