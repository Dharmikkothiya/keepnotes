import 'package:flutter/material.dart';
import 'package:keepnotes/pages/private_note_page.dart';
import 'package:keepnotes/pages/task_page.dart';

import '../component/classes/Typography/fontDictionary.dart';
import 'audio_page.dart';
import 'camera_page.dart';
import 'drawing_page.dart';
import 'file_page.dart';
import 'note_page.dart';

class PlusTabPage extends StatefulWidget {
  const PlusTabPage({super.key});

  @override
  State<PlusTabPage> createState() => _PlusTabPageState();
}

List<Map<String, dynamic>> noteTypeList = [
  {
    "ItemIcon": Icons.photo_camera_outlined,
    "ItemName": "Camara",
    "ItemPage": const CameraPage(),
  },
  {
    "ItemIcon": Icons.gesture_rounded,
    "ItemName": "Drawing Sketch",
    "ItemPage": const DrawingPage(),
  },
  {
    "ItemIcon": Icons.attach_file_outlined,
    "ItemName": "Attach File",
    "ItemPage": const FilePage(),
  },
  {
    "ItemIcon": Icons.mic_none_outlined,
    "ItemName": "Audio File",
    "ItemPage": const AudioPage(),
  },
  {
    "ItemIcon": Icons.lock_outlined,
    "ItemName": "Private Notes",
    "ItemPage": const PrivateNotePage(),
  },
];
List<Map<String, dynamic>> noteTypeList2 = [
  {
    "ItemIcon": Icons.description_outlined,
    "ItemName": "Notes",
    "ItemPage": const NotePage(),
    "ItemColor": tColor,
  },
  {
    "ItemIcon": Icons.list_outlined,
    "ItemName": "Task",
    "ItemPage": const TaskPage(),
    "ItemColor": taskCo,
  },
];

class _PlusTabPageState extends State<PlusTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: sColor,
          child: const Icon(
            Icons.close,
            size: 45,
            color: pColorL,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 65,
            ),
            const Text(
              "What Notes \nDo you Want??",
              style: FontStyles.H1,
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: 370,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: gColorD,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                noteTypeList[index]['ItemPage'],
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            noteTypeList[index]['ItemIcon'],
                            color: sColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${noteTypeList[index]['ItemName']}",
                            style: FontStyles.H2,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: gColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 2),
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: gColorD,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Row(
                  children: List.generate(
                    2,
                    (index) {
                      return Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      noteTypeList2[index]['ItemPage'],
                                ));
                          },
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                color: noteTypeList2[index]['ItemColor'],
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  noteTypeList2[index]['ItemIcon'],
                                  color: pColorL,
                                  size: 30,
                                ),
                                Text(
                                  "${noteTypeList2[index]['ItemName']}",
                                  style: FontStyles.H2W,
                                ),
                              ],
                            )),
                          ),
                        ),
                      ));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
