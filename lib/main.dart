import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keepnotes/pages/homepage.dart';
import 'package:keepnotes/pages/plus_tab_page.dart';
import 'package:keepnotes/pages/task.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep Notes',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: Homepage(
        NoteData: [],
      ),
    );
  }
}
