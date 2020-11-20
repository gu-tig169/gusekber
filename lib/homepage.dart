import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/main.dart';

import 'newtaskview.dart';
import 'constants.dart';
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
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  })
            ]),
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => ToDoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: barColor,
        onPressed: () async {
          var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewTaskView(Todos(input: ''))));
          //Lägger till Todo i listan av Todos.
          Provider.of<MyState>(context, listen: false).addTodo(newTodo);
        },
      ),
    );
  }
}

void choiceAction(String choice) {
  if (choice == Constants.All) {
    print('All');
  } else if (choice == Constants.Done) {
    print('Done');
  } else if (choice == Constants.Undone) {
    print('Undone');
  }
}
