import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'newtask.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  HomePage({this.homePage});

  final String homePage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: AppBar(
          backgroundColor: barColor,
          elevation: 20,
          centerTitle: true,
          title: Text(
            'ADD ACTIVITY',
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: 'Amatic SC',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: barColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTask()),
          );
        },
      ),
      body: _tasklist(),
    );
  }

  Widget _tasklist() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text('Städa',
              style: TextStyle(
                fontFamily: 'IndieFlower',
              )),
          trailing: Icon(Icons.clear),
        ),
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text('Träna'),
          trailing: Icon(Icons.clear),
        ),
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text('Plugga'),
          trailing: Icon(Icons.clear),
        ),
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text('Handla'),
          trailing: Icon(Icons.clear),
        ),
      ],
    );
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
}
