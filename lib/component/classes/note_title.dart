import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Typography/fontDictionary.dart';

class NoteTitle extends StatefulWidget {
  TextEditingController titleC;
  NoteTitle({super.key, required this.titleC});

  @override
  State<NoteTitle> createState() => _NoteTitleState();
}

class _NoteTitleState extends State<NoteTitle> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.titleC,
      decoration: const InputDecoration(
        hintText: "TITLE",
        border: InputBorder.none,
      ),
      style: FontStyles.NT,
    );
  }
}
