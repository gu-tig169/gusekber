import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/taskmodel.dart';
import 'package:provider/provider.dart';
import './taskmodel.dart';

class ToDoList extends StatelessWidget {
  final List<Todos> list;

  ToDoList(this.list);
  bool isChecked = true;

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((todo) => _itemTodo(context, todo)).toList());
  }

  Widget _itemTodo(context, todo) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        leading: Checkbox(
            checkColor: textColor,
            activeColor: barColor,
            focusColor: barColor,
            value: todo.done,
            onChanged: (bool newValue) {
              var state = Provider.of<MyState>(context, listen: false);
              state.checkTodo(todo, newValue);
            }),
        title: Text(
          todo.input,
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.w400,
            fontSize: 25,
            color: textColor,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: textColor,
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTodo(todo);
          },
        ),
      ),
    );
  }
}
