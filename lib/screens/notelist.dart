import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_keep/screens/notedetails.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text(
            'NotesKeep',
            style: TextStyle(color: Color(0xFF442B2D),),
          ),
        ),

      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color(0xFFEAA4A4),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return NoteDetails('Add Note');
          }));
        },
      tooltip: 'Add a Note',
      child: Icon(Icons.add),
      ),
          );
        }
      
     ListView getNoteListView() {
       TextStyle titlestyle= Theme.of(context).textTheme.subtitle1;
       return ListView.builder(
         itemCount: count,
         itemBuilder: (BuildContext context, int position){
           return Card(
               color: Colors.white,
               elevation: 2.0,
               child: ListTile(
                 leading: CircleAvatar(
                   backgroundColor: Colors.black,
                   child: Icon(Icons.keyboard_arrow_right),
                 ),
                 title: Text('Dummy Title', style:titlestyle),
                 subtitle: Text('Dummy Date', style:titlestyle),
                trailing: Icon(Icons.delete, color: Colors.red,),
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
            return NoteDetails('Edit Note');
          }));
                print('object');
              },
               ),
           );
         }
         );
     }
}
