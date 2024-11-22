import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_offline_app/home_screen/home_screen.dart';
import 'package:to_do_offline_app/my_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_offline_app/providers/list_prividers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ?

      /// if our platform is android?
      await Firebase.initializeApp(

          ///initialize fireBase
          options: FirebaseOptions(
              apiKey: 'AIzaSyCxsLtYAMr_pbBAqbANCJnwloWGcRj1JxQ',
              appId: 'com.example.to_do_offline_app',

              ///appId = package_name
              messagingSenderId: '602502572435',

              ///messagingSenderId = project_number
              projectId: 'to-do-offline-app'))
      : await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider( // after we create provider we should put 'MyApp()' in 'ChangeNotifierProvider()' widget
    create: (Context)=>ListProviders(), //' create : ' is responsible on create our provider
    child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: MyThemeData.lightTheme,
    );
  }
}
