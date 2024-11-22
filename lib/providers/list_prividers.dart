import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_offline_app/fire_base_utiz.dart';
import 'package:to_do_offline_app/model/task.dart';

/// in provider we put :
/// 1) data : that when it changed will affect on a many widgets
/// 2) function : thit will change data
class ListProviders extends ChangeNotifier {
/// data :
  List<Task> tasksList = [];
  DateTime selectDate =DateTime.now(); ///we don't have selectDate in provider so we create it
  ///function :
  /// 1) getAllTasksFromFireStore
  void getAllTasksFromFireStore() async {
    //function for read data from phire store
    QuerySnapshot<Task> querySnapShot = await FireBaseUtiz.getTaskCollection().get(); // we should get on collection for read task and we will use 'get()' for read data
    //  List<QueryDocumentSnapshot<T>> => List<Task> ===>>> we wnt convert List from {QueryDocumentSnapshot<T>} to List of {Task}
    tasksList = querySnapShot.docs.map((docs) {
      //' .map ' : function for convert data type for another data type
      return docs.data();
    }).toList(); // the map return iterable and we want from it return List so we use function '.toList()'

    /// 2) filiters tasks by selectDate
    tasksList =tasksList.where((task) { ///'.where' : function that do looping for sure if the dateTime in task in list == dateTime or no
      if( selectDate.day == task.dateTime.day
          && selectDate.month ==task.dateTime.month
          && selectDate.year == task.dateTime.year) {
        return true;
      }
      return false;
    }).toList();
    notifyListeners(); // after we end from function we should use 'notifyListeners()' because it send notification for any thing related by data the data changed
  }
  void changeSelectDate(DateTime newSelectDate){
   selectDate=newSelectDate;
   getAllTasksFromFireStore();
  }
 }
