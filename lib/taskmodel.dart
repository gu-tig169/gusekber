import 'package:flutter/material.dart';
import './getapi.dart';

class Todos {
  String input;
  String id;
  bool done;

  Todos({
    this.input,
    this.id,
    this.done = false,
  });

  static Map<String, dynamic> toJson(Todos todo) {
    return {
      'title': todo.input,
      'done': todo.done,
    };
  }

  static Todos fromJson(Map<String, dynamic> json) {
    return Todos(
      input: json['title'],
      id: json['id'],
      done: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Todos> _list = [];
  List<Todos> get list => _list;

  String _filterTodo = 'all';
  String get filterTodo => _filterTodo;

  Future getList() async {
    List<Todos> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addTodo(Todos todo) async {
    await Api.addTodo(todo);
    await getList();
  }

  void removeTodo(Todos todo) async {
    await Api.removeTodo(todo.id);
    await getList();
  }

  void checkTodo(Todos todo, bool done) async {
    todo.done = done;
    await Api.checkTodo(todo, todo.id);
    await getList();
  }

  void setFilterTodo(String filterTodo) async {
    this._filterTodo = filterTodo;
    notifyListeners();
  }
}
