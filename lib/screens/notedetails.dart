import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
 String appBarTitle;
 NoteDetails(this.appBarTitle);
  
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  String appBarTitle;
  _NoteDetailsState(this.appBarTitle);
  static var _priorities = ['High', 'Low'];
  @override
  Widget build(BuildContext context) {
    
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController descEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle,
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
                 style: TextStyle(
                      color: Color(0xFF442B2D)
                    ),
                  value: 'Low',
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      print('User selected $valueSelectedByUser');
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
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                   labelStyle: TextStyle(
                      color: Color(0xFF442B2D)
                    ),
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
               style: TextStyle(
                      color: Color(0xFF442B2D)
                    ),
                onChanged: (value) {
                  print('text changed');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Color(0xFF442B2D)
                    ),
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
}
