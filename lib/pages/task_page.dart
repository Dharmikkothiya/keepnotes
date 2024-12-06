import 'package:flutter/material.dart';
import 'package:keepnotes/component/classes/note_title.dart';

import '../component/classes/Typography/fontDictionary.dart';
import '../component/classes/notetype_appbar.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

TextEditingController taskTitleController = TextEditingController();
TextEditingController taskController0 = TextEditingController();
TextEditingController taskController1 = TextEditingController();
TextEditingController taskController2 = TextEditingController();
TextEditingController taskController3 = TextEditingController();
TextEditingController taskController4 = TextEditingController();
TextEditingController taskController5 = TextEditingController();
TextEditingController taskController6 = TextEditingController();
TextEditingController taskController7 = TextEditingController();
TextEditingController taskController8 = TextEditingController();
// List<bool> completed = [false, false, false, false, false, false];
int checkCount = 1;

List<Map<String, dynamic>> taskL = [
  {
    "completed": false,
    "taskName": taskController0.text,
    "Controller": taskController0
  },
  {
    "completed": false,
    "taskName": taskController1.text,
    "Controller": taskController1
  },
  {
    "completed": false,
    "taskName": taskController2.text,
    "Controller": taskController2
  },
  {
    "completed": false,
    "taskName": taskController3.text,
    "Controller": taskController3
  },
  {
    "completed": false,
    "taskName": taskController4.text,
    "Controller": taskController4
  },
  {
    "completed": false,
    "taskName": taskController5.text,
    "Controller": taskController5
  },
  {
    "completed": false,
    "taskName": taskController6.text,
    "Controller": taskController6
  },
  {
    "completed": false,
    "taskName": taskController7.text,
    "Controller": taskController7
  },
  {
    "completed": false,
    "taskName": taskController8.text,
    "Controller": taskController8
  },
];

class _TaskPageState extends State<TaskPage> {
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
                notetype: "task",
                taskC: taskL,
                noteT: taskTitleController,
                noteC: taskL[0]['Controller'],
                labalNote: false,
              ),
              NoteTitle(titleC: taskTitleController),
              Expanded(
                child: ListView.builder(
                  itemCount: checkCount,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              taskL[index]['completed'] =
                                  !taskL[index]['completed'];
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: taskL[index]['completed'] == false
                                  ? Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: gColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    )
                                  : Container(
                                      width: 30,
                                      child: Icon(
                                        Icons.check,
                                        color: pColorL,
                                      ),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: tColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    )),
                        ),
                        Expanded(
                            child: Container(
                          child: TextField(
                            onTap: () {
                              setState(() {
                                checkCount <= 5 ? checkCount++ : checkCount;
                                taskL[index]['taskName'] =
                                    taskL[index]['Controller'].text;
                                taskL[index]['Controller'].clear();
                              });
                            },
                            minLines: 1,
                            decoration: InputDecoration(),
                            maxLines: 3,
                            controller: taskL[index]['Controller'],
                            style: taskL[index]['completed'] == false
                                ? FontStyles.H2
                                : FontStyles.H2C,
                          ),
                        ))
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
