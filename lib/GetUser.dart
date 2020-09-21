import 'User.dart';
import 'package:http/http.dart' as http;

Future <List<Users>> fetchUsers() async{
  String url = 'http://192.168.31.36/flutterConnections/Connection.php';
  final response = await http.get(url);
  return usersFromJson(response.body);
}