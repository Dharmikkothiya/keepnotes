import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/note_title.dart';

import '../component/classes/notetype_appbar.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

TextEditingController draNoteT = TextEditingController();

class _DrawingPageState extends State<DrawingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // NAppbar(
              //   labalNote: false,
              // ),
              NoteTitle(
                titleC: draNoteT,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
