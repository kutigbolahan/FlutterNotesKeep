import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_keep/database/dbHelper.dart';
import 'package:notes_keep/models/notes.dart';
import 'package:notes_keep/screens/notedetails.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  // DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    //final dbhelp = Provider.of<DatabaseHelper>(context);
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/1.png'),
        ),
        title: Center(
          child: Text(
            'NotesKeep',
            style: TextStyle(
              color: Color(0xFF442B2D),
            ),
          ),
        ),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEAA4A4),
        onPressed: () {
          navigateToDetail(
              Note(
                '',
                '',
                2,
              ),
              'Add Note');
        },
        tooltip: 'Add a Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getPriorityColor(noteList[position].priority),
                child: getPriorityIcon(noteList[position].priority),
              ),
              title: Text(noteList[position].title),
              subtitle: Text(noteList[position].date),
              trailing: IconButton(
                onPressed: () {
                  _delete(context, noteList[position]);
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
              onTap: () {
                navigateToDetail(this.noteList[position], 'Edit Note');
                print('object');
              },
            ),
          );
        });
  }

  //return the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  //return priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.error, color: Colors.white,);
        break;
      case 2:
        return Icon(Icons.fiber_manual_record,color: Colors.white,);
        break;
      default:
        return Icon(Icons.fiber_manual_record,color: Colors.white);
    }
  }

  //delete funtion through the icon
  void _delete(context, Note note) async {
    int result = await Provider.of<DatabaseHelper>(context, listen: false)
        .deleteNote(note.id);
    if (result != 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Note Deleted Successfully'),
        duration: Duration(seconds: 1),
      ));
      updateListView();
    }
  }

//function to update list view
  void updateListView() {
    final Future<Database> dbFuture =
        Provider.of<DatabaseHelper>(context,listen: false).initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture =
          Provider.of<DatabaseHelper>(context, listen: false).getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, title);
    }));

    if (result ==true) {
      updateListView();
      
    }
  }
}
