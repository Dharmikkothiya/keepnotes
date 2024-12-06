import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/note_title.dart';

import '../component/classes/notetype_appbar.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

TextEditingController camNoteT = TextEditingController();

class _CameraPageState extends State<CameraPage> {
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
                titleC: camNoteT,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
