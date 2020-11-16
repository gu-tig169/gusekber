import 'package:flutter/material.dart';
import 'package:todolist/main.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
              fontWeight: FontWeight.bold,
              fontFamily: 'Amatic SC',
            ),
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
        decoration: InputDecoration(
          hintText: 'Write your task here...',
          //border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: barColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }

  Widget _raisedButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: barColor,
        textColor: Colors.white,
        label: Text('ADD'),
        onPressed: () {},
        icon: Icon(Icons.add),
      ),
    );
  }
}
