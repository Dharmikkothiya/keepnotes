import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/note_title.dart';

import '../component/classes/notetype_appbar.dart';

class PrivateNotePage extends StatefulWidget {
  const PrivateNotePage({super.key});

  @override
  State<PrivateNotePage> createState() => _PrivateNotePageState();
}

TextEditingController prvNoteT = TextEditingController();

class _PrivateNotePageState extends State<PrivateNotePage> {
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
                titleC: prvNoteT,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
