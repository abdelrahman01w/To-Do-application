import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_offline_app/model/task.dart';

class FireBaseUtiz {
  static CollectionReference<Task> getTaskCollection() {
    /// function for get collection and convert it from json to object or from opject to json
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        . //" FirebaseFirestore.instance" : object from FirebaseFirestore to access any thing in fire base , .collection() : function for search on your collection in fire store or create collection
        withConverter<Task>(
            // withConverter : it can be knowed firebase what is a kind of thing that will be stored in fire store
            fromFirestore: (snapshot, options) =>
                Task.fromPhireStore(snapshot.data()!),
            toFirestore: (task, options) => task.toFireStore());
  }

  // add task
  static Future<void> addTaskToFireStore(Task task) {
    var taskCollection = getTaskCollection();
    DocumentReference taskDocRef = taskCollection.doc();

    /// create docoument
    task.id = taskDocRef.id; // create auto id and put it in ID in task
    return taskDocRef.set(task);
  }
}
