import 'package:flutter/material.dart';
import 'package:to_do_offline_app/home_screen/list_tap/add_task_bottom_sheet.dart';
import 'package:to_do_offline_app/home_screen/list_tap/list_tap.dart';
import 'package:to_do_offline_app/home_screen/setting_tap/setting_tap.dart';

import '../app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName='HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: MediaQuery.of(context).size.height*0.2, or we can make Container down appbar
        title: Text('To Do List',
          style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primaryLight,
            height: MediaQuery.of(context).size.height*0.1
          )
          , Expanded(child: taps[selectIndex])
        ],
      ),
      bottomNavigationBar: BottomAppBar( /// we put BottomNavigationBarItem in BottomAppBar for notch
       height: MediaQuery.of(context).size.height*0.107,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: selectIndex,///tap selected
          onTap: (index){
            selectIndex=index;
            setState(() {
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list)
                ,label: 'Task lists'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings)
                ,label: 'Settings'
            )
          ],
        ),
      ), ///setting+list
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addTaskBottomSheet();
        },
        child: Icon(Icons.add,size: 35,),
      ), ///add to do list
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  List<Widget>taps=[ListTap(),SettingTap()];

  void addTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context)=>AddTaskBottomSheet()
    );
  }
}
