import 'package:flutter/material.dart';

class Todos {
  String input;
  bool done;

  Todos({
    this.input,
    this.done = false,
  });
}

class MyState extends ChangeNotifier {
  List<Todos> _list = [];
  List<Todos> get list => _list;

  void addTodo(Todos todo) {
    _list.add(todo);
    notifyListeners();
  }

  void removeTodo(Todos todo) {
    _list.remove(todo);
    notifyListeners();
  }

  void checkTodo(Todos todo, bool done) {
    todo.done = done;
    notifyListeners();
  }
}
