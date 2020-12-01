import 'package:http/http.dart' as http;
import 'dart:convert';

import './taskmodel.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'f461beea-122e-465f-8853-b64150bd58cf';

class Api {
  static Future addTodo(Todos todo) async {
    var json = jsonEncode(Todos.toJson(todo));
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
      body: json,
    );
  }

  static Future checkTodo(Todos todo, String todoId) async {
    var json = jsonEncode(Todos.toJson(todo));
    print(json);
    await http.put(
      '$API_URL/todos/$todoId?key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
      body: json,
    );
  }

  static Future removeTodo(String todoId) async {
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');
  }

  static Future<List<Todos>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);

    return json.map<Todos>((data) {
      return Todos.fromJson(data);
    }).toList();
  }
}
