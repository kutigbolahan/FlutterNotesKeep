//help us to represent our database table

 class Note {
  int id;
  String title;
  String description;
  String date;
  int priority;

  Note( this.title, this.date, this.priority, [this.description]);
  Note.withId(this.id, this.title, this.date, this.priority, [this.description]);

  int get getid => id;
  String get gettitle => title;
  String get getdescription => description;
  String get getdate => date;
  int get getpriority => priority;

  set settitle(String newTitle) {
    if (newTitle.length <= 255) {
      this.title = newTitle;
    }
  }

  set setdescription(String newdescription) {
    if (newdescription.length <= 255) {
      this.description = newdescription;
    }
  }

  set setpriority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this.priority = newPriority;
    }
  }

  set setdate(String newDate) {
    this.date = newDate;
  }

  //convert our Note object to our map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['title'] = title;
    map['description'] = description;
    map['priority'] = priority;
    map['date'] = date;
    return map;
  }

//Extract a note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.description = map['description'];
    this.priority = map['priority'];
    this.date = map['date'];
  }
}
