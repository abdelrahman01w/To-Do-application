import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_offline_app/model/task.dart';
import 'package:to_do_offline_app/providers/list_prividers.dart';

import '../../app_colors.dart';

class TaskListItem extends StatefulWidget {
  Task task;
  TaskListItem({required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProviders>(context);

    return Container(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(22)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(12),
              color: AppColors.primaryLight,
              height: MediaQuery.of(context).size.height * 0.1,
              width: 6,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.task.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.primaryLight,
                        )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(widget.task.description,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                        ))
              ],
            )),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryLight),
              child: Icon(
                Icons.check,
                color: AppColors.whiteColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
