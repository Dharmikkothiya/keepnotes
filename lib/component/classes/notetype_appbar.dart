import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/Typography/fontDictionary.dart';
import 'package:keepnotes/pages/homepage.dart';

class NAppbar extends StatefulWidget {
  bool labalNote;
  bool lockNote;

  TextEditingController noteT;
  TextEditingController noteC;
  List<Map<String, dynamic>> taskC;
  var selectedDate;
  var notetype;
  NAppbar(
      {super.key,
      required this.labalNote,
      required this.lockNote,
      required this.notetype,
      this.selectedDate,
      required this.taskC,
      required this.noteT,
      required this.noteC});

  @override
  State<NAppbar> createState() => _NAppbarState();
}

String? passwordOk;
List dateList = ["23 May, 2023", "24 May, 2023", "25 May, 2023"];
List<NOTE> newNote = [];
TextEditingController lockPasswordController = TextEditingController();
TextEditingController reLockPasswordController = TextEditingController();

class NOTE {
  final notetype;
  final title;
  final content;
  final contentT;
  final timestamp;
  final passowrd;
  final bool labalNote;
  final bool lockNote;

  NOTE({
    required this.notetype,
    required this.title,
    required this.content,
    this.contentT,
    this.passowrd,
    required this.timestamp,
    this.labalNote = false,
    this.lockNote = false,
  });
}

class _NAppbarState extends State<NAppbar> {
  void saveNote() {
    setState(() {
      newNote.add(NOTE(
          notetype: widget.notetype,
          title: widget.noteT.text,
          content: widget.noteC.text,
          contentT: widget.taskC,
          timestamp: widget.selectedDate,
          lockNote: widget.lockNote,
          passowrd: passwordOk,
          labalNote: widget.labalNote));
      widget.noteT.clear();
      widget.noteC.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  saveNote();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(
                          NoteData: newNote,
                        ),
                      ));
                },
                child: const Icon(
                  size: 28,
                  Icons.close,
                  color: gColor,
                )),
            Spacer(),
            IconButton(
                onPressed: () {
                  widget.lockNote = !widget.lockNote;
                  widget.lockNote == true
                      ? showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: 250,
                                width: 280,
                                decoration: BoxDecoration(
                                    color: gColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      maxLength: 4,
                                      style: FontStyles.H2,
                                      controller: lockPasswordController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          filled: true,
                                          constraints: BoxConstraints(
                                              minWidth: 180, maxWidth: 190),
                                          labelStyle: FontStyles.H2,
                                          labelText: "Enter Password",
                                          fillColor: pColorL,
                                          counter: SizedBox(),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black))),
                                    ),
                                    TextField(
                                      maxLength: 4,
                                      style: FontStyles.H2,
                                      controller: reLockPasswordController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          filled: true,
                                          labelStyle: FontStyles.H2,
                                          labelText: "Enter RePassword",
                                          constraints: BoxConstraints(
                                              minWidth: 180, maxWidth: 190),
                                          fillColor: pColorL,
                                          counter: SizedBox(),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black))),
                                    ),
                                    MaterialButton(
                                      color: tColor,
                                      onPressed: () {
                                        reLockPasswordController.text ==
                                                lockPasswordController.text
                                            ? passwordOk =
                                                lockPasswordController.text
                                            : widget.lockNote = false;
                                      },
                                      child: Text(
                                        "LOCK",
                                        style: FontStyles.H2,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox();
                  setState(() {});
                  for (int i = 0; i < newNote.length; i++) {
                    print("title: ${newNote[i].title}");
                    print("content: ${newNote[i].content}");
                    print("labalNote: ${newNote[i].labalNote}");
                    print("timestamp: ${newNote[i].timestamp}");
                    print("timestamp: ${newNote[i].contentT[0]["completed"]}");
                    print("timestamp: ${newNote[i].contentT[0]["taskName"]}");
                    print("timestamp: ${newNote[i].contentT[1]["completed"]}");
                    print("timestamp: ${newNote[i].contentT[1]["taskName"]}");
                  }
                },
                icon: widget.lockNote == true
                    ? Icon(
                        Icons.lock_outline,
                        color: tColor,
                      )
                    : Icon(
                        Icons.lock_open_rounded,
                        color: gColor,
                      )),
            InkWell(
                onTap: () {},
                child: const Icon(
                  size: 28,
                  Icons.person_add_alt,
                  color: gColor,
                )),
            const SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  widget.labalNote = !widget.labalNote;
                  setState(() {});
                },
                child: RotatedBox(
                    quarterTurns: 3,
                    child: widget.labalNote == false
                        ? const Icon(
                            size: 28,
                            Icons.label_outline,
                            color: gColor,
                          )
                        : const Icon(
                            size: 28,
                            Icons.label,
                            color: tColor,
                          ))),
            SizedBox(
              width: 20,
            ),
            PopupMenuButton(
              icon: const Icon(
                size: 28,
                Icons.more_horiz_outlined,
                color: gColor,
              ),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text("setting")),
                  const PopupMenuItem(child: Text("setting")),
                  const PopupMenuItem(child: Text("setting")),
                  const PopupMenuItem(child: Text("setting")),
                ];
              },
            ),
          ],
        ),
        Row(
          children: [
            DropdownButton(
              underline: SizedBox(),
              value: widget.selectedDate,
              hint: Text(
                "28 May, 2023",
              ),
              icon: RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: gColor,
                  )),
              items: List.generate(
                dateList.length,
                (index) => DropdownMenuItem(
                    value: dateList[index], child: Text("${dateList[index]}")),
              ),
              onChanged: (value) {
                widget.selectedDate = value;
                setState(() {});
              },
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
