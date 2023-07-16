import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timefusion/Pages/Calendar.dart';
import 'package:timefusion/Pages/KanbanPage.dart';
import 'package:timefusion/Pages/Login.dart';
import 'package:timefusion/Pages/projectsPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/HomeScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Fusion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
