import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_offline_app/app_colors.dart';
import 'package:to_do_offline_app/fire_base_utiz.dart';
import 'package:to_do_offline_app/model/task.dart';

import '../../providers/list_prividers.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  var selectedDate = DateTime.now();
  late ListProviders listProvider; /// we intialize object from ListProviders for we can use provider in any function out 'build'
  @override
  Widget build(BuildContext context) {
     listProvider = Provider.of<ListProviders>(context);
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: Text('Add new task',
                  style: Theme.of(context).textTheme.titleMedium)),
          Form(
              key: formKey,

              /// we can access for any thing in 'form' by this key
              child: Column(
                children: [
                  TextFormField(
                    /// we use validator for check if the user enter true data like title or no
                    validator: (text) {
                      if (text == null || text.isEmpty)

                      /// the user doesn't enter any thing
                      {
                        return 'please enter task title';
                      }
                      return null;

                      /// the data is true 'valied'
                    },
                    decoration: InputDecoration(hintText: 'Enter the title'),
                    onChanged: (text) {
                      title = text;
                    },
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task description';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter the description'),
                    maxLines: 4,
                    onChanged: (text) {
                      description = text;
                    },
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Select Date ',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextButton(
                onPressed: () {
                  showCalender();
                },
                child: Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                )),
          ),
          ElevatedButton(
              onPressed: () {
                addTask();
              },
              child: Text(
                'add',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.primaryLight),
              ))
        ],
      ),
    );
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      ///'currentState?.validate()': this fun. create looping in all validator in form and check if it true or false
      Task task =
          Task(title: title, description: description, dateTime: selectedDate);

      /// we can use for solve the data is future :
      /// .then(onValue) : online if the function will return success data
      /// .timeout(timeLimit) : offline if the function will return success data
      /// .onError(handleError) : if the function didn't return data and it knowed our where is rhe error
      ///.catchError(onError):if the function didn't return data and it doesn't knowed our where is rhe error
      FireBaseUtiz.addTaskToFireStore(task).timeout(Duration(seconds: 2),

          ///after 2 seconds print
          onTimeout: () {
        print('task added successfuly');
        listProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }

  void showCalender() async {
    var chooseDate = await showDatePicker(
        context: context,

        /// 'showDatePicker' it's return DateTime or null
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    // if(chooseDate != null) {
    //   selectedDate = chooseDate;
    //  }
    selectedDate = chooseDate ?? selectedDate;

    /// if it is null put the selectedDate
    setState(() {});
  }
}
