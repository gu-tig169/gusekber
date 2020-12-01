import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/main.dart';

import 'newtaskview.dart';
import 'taskmodel.dart';
import 'todolist.dart';

class HomePageView extends StatefulWidget {
  HomePageView({this.homePageView});

  final String homePageView;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          backgroundColor: barColor,
          elevation: 20,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'TO-DO LIST',
              style: TextStyle(
                fontSize: 50.0,
                fontFamily: 'AmaticSC',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            PopupMenuButton(
                onSelected: (value) async {
                  Provider.of<MyState>(context, listen: false)
                      .setFilterTodo(value);
                },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text('All'), value: 'All'),
                      PopupMenuItem(child: Text('Done'), value: 'Done'),
                      PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                    ]),
          ],
        ),
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            ToDoList(filterList(state.list, state.filterTodo)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: barColor,
        onPressed: () async {
          var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewTaskView(Todos(
                        input: '',
                      ))));
          //Lägger till Todo i listan av Todos.
          if (newTodo != null) {
            Provider.of<MyState>(context, listen: false).addTodo(newTodo);
          }
        },
      ),
    );
  }
}

List<Todos> filterList(list, filterTodo) {
  if (filterTodo == 'Done') {
    return list.where((item) => item.done == true).toList();
  } else if (filterTodo == 'Undone') {
    return list.where((item) => item.done == false).toList();
  }
  return list;
}
