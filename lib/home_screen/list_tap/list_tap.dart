import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_offline_app/home_screen/list_tap/task_list_item.dart';
import 'package:to_do_offline_app/model/task.dart';
import 'package:to_do_offline_app/providers/list_prividers.dart';


class ListTap extends StatefulWidget {
  const ListTap({super.key});

  @override
  State<ListTap> createState() => _ListTapState();
}

class _ListTapState extends State<ListTap> {
  List<Task> tasksList = [];
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProviders>(context);
    if(listProvider.tasksList.isEmpty){
    listProvider.getAllTasksFromFireStore();
    }
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: listProvider.selectDate, /// it mean that if user change any date the list tap will display task for this day
          onDateChange: (selectedDate) {
            listProvider.changeSelectDate(selectedDate);///function for change old date for new date that the user select it
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskListItem(
                task: listProvider.tasksList[index],
              ); // tasksList[] : contain on object from (Task)
            },
            itemCount: listProvider.tasksList.length,
          ),
        )
      ],
    );
  }
}
