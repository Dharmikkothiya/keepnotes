import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/note_title.dart';

import '../component/classes/notetype_appbar.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

TextEditingController audioNoteT = TextEditingController();

class _AudioPageState extends State<AudioPage> {
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
                titleC: audioNoteT,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
