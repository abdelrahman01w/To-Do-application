class Task {
  /// model for represent data class for tasks
  static const String collectionName = 'tasks';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  Task.fromPhireStore(Map<String, dynamic> data)
      : this(
          id: data['id']
              as String, // "ad" : casting for convert data from dynamic to any data type
          title: data['title'] as String,
          description: data['description'] as String,
          dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime'])
              as DateTime, //.fromMillisecondsSinceEpoch : function for convert DateTime from int to DateTime
          isDone: data['isDone'] as bool,
        );
  // {
  //   id = data['id'];    /// if we want access any thing in map we use : name[value]
  //   title = data['title'];
  //   description = data['description'];
  //   dateTime = data['dateTime'];
  //   isDone = data['isDone'];
  // }

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecond,

      ///(.millisecond // .microsecond )=> function convert time from "DateTime" to "time" for any operation on time
      'isDone': isDone
    };
  }
}
// devolopers : objest like task
// phirebase  : json
// {} => json object , [] => json array

// we want convert from 'object' to 'json'  : send from 'devoloper' to 'phirebase' => to json , to firestore
// we want convert from 'json' to 'object'  : send from 'phirebase' to 'devoloper'

// firebase deal with map<string,dynamic>
//                       <  key , value >
