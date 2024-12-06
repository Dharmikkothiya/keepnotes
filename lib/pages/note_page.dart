import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/note_title.dart';

import '../component/classes/notetype_appbar.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

TextEditingController noteT = TextEditingController();
TextEditingController noteC = TextEditingController();

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              NAppbar(
                lockNote: false,
                taskC: [],
                noteC: noteC,
                noteT: noteT,
                labalNote: false,
                notetype: "Note",
              ),
              NoteTitle(
                titleC: noteT,
              ),
              Expanded(
                child: Container(
                  child: Expanded(
                      child: TextField(
                    controller: noteC,
                    decoration: InputDecoration(border: InputBorder.none),
                    minLines: 3,
                    maxLines: 6,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
