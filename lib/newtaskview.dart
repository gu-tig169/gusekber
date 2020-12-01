import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import './taskmodel.dart';

class NewTaskView extends StatefulWidget {
  final Todos todo;

  NewTaskView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return NewTaskViewState(todo);
  }
}

class NewTaskViewState extends State<NewTaskView> {
  String input;

  TextEditingController textEditingController;

  NewTaskViewState(Todos todo) {
    this.input = todo.input;

    textEditingController = TextEditingController(text: todo.input);

    textEditingController.addListener(() {
      setState(() {
        input = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          backgroundColor: barColor,
          elevation: 20,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('ADD TASK',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AmaticSC',
                )),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 32),
            _textInputField(),
            _raisedButton(),
          ],
        ),
      ),
    );
  }

  Widget _textInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'Write your task here...',
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _raisedButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textColor: Colors.white,
        label: Text('ADD'),
        onPressed: () {
          Navigator.pop(
              context,
              Todos(
                input: input,
              ));
        },
        icon: Icon(Icons.add),
        color: barColor,
      ),
    );
  }
}
