import 'package:flutter/material.dart';
import 'package:notes_keep/database/dbHelper.dart';
import 'package:notes_keep/models/notes.dart';
import 'package:provider/provider.dart';

class NoteDetails extends StatefulWidget {
  final String appBarTitle;
  final Note note;
  NoteDetails(this.note, this.appBarTitle);

  @override
  _NoteDetailsState createState() =>
      _NoteDetailsState(this.note, this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  String appBarTitle;
  Note note;
  _NoteDetailsState(
    this.note,
    this.appBarTitle,
  );
  static var _priorities = ['High', 'Low'];

  @override
  Widget build(BuildContext context) {
    //final dbhelp = Provider.of<DatabaseHelper>(context);
    titleEditingController.text = note.title;
    descEditingController.text = note.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Color(0xFF442B2D),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: TextStyle(color: Color(0xFF442B2D)),
                  value: getPriorityAsString(note.priority),
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      print('User selected $valueSelectedByUser');
                   updatePriority(valueSelectedByUser);
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextField(
                controller: titleEditingController,
                // style: textStyle,
                onChanged: (value) {
                  print('text changed');
                  updadeTitle();
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Color(0xFF442B2D)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextField(
                controller: descEditingController,
                style: TextStyle(color: Color(0xFF442B2D)),
                onChanged: (value) {
                  print('text changed');
                  updateDescriotion();
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Color(0xFF442B2D)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  // color: Theme.of(context).primaryColor,
                  textColor: Color(0xFF442B2D),
                  child: Text('Save'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    print('save button');
                    // setState(() {

                    // });
                  },
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Color(0xFF442B2D),
                  elevation: 2.0,
                  child: Text('Delete'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    print('delete button');
                    // setState(() {

                    // });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
//convert the string priority in the form of integer before saving it
  void updatePriority(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
      default:
    }
  }

//convert the integer priority in the form of string priority and display to user in dropdown

String getPriorityAsString(int value) {
  String priority;
    switch (value) {
      case 1:
       priority = _priorities[0];
        break;
      case 2:
        priority =_priorities[1];
        break;
      default:
    }
    return priority;
  }

  void updadeTitle(){
    note.title = titleEditingController.text;
  }
  void updateDescriotion(){
    note.description = descEditingController.text;
  }
  

}

