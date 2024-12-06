import 'package:flutter/material.dart';
import 'package:keepnotes/pages/plus_tab_page.dart';

import '../component/classes/Typography/fontDictionary.dart';
import '../component/classes/notetype_appbar.dart';

class Homepage extends StatefulWidget {
  List<NOTE> NoteData;
  Homepage({super.key, required this.NoteData});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlusTabPage(),
                ));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: sColor,
          child: const Icon(
            Icons.add,
            size: 45,
            color: pColorL,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello,\nMy Notes",
                        style: FontStyles.H1,
                      ),
                      Icon(
                        Icons.tune,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        hintText: "Search Here",
                        prefixIcon: const Icon(Icons.search),
                        fillColor: pColorL,
                        filled: true),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 496,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: widget.NoteData.length,
                      itemBuilder: (context, index) {
                        return widget.NoteData[index].lockNote == true
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: Container(
                                              height: 180,
                                              width: 280,
                                              decoration: BoxDecoration(
                                                  color: gColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    maxLength: 4,
                                                    style: FontStyles.H2,
                                                    controller:
                                                        lockPasswordController,
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                        filled: true,
                                                        constraints:
                                                            BoxConstraints(
                                                                minWidth: 180,
                                                                maxWidth: 190),
                                                        labelStyle:
                                                            FontStyles.H2,
                                                        labelText:
                                                            "Enter Password",
                                                        fillColor: pColorL,
                                                        counter: SizedBox(),
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                  ),
                                                  MaterialButton(
                                                    color: tColor,
                                                    onPressed: () {},
                                                    child: Text(
                                                      "UNLOCK",
                                                      style: FontStyles.H2,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: gColorD,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.lock,
                                                  color: sColor,
                                                  size: 40,
                                                ),
                                                Text(
                                                  "Secure Password \nProtection Note",
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: -10,
                                            right: 0,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.more_horiz,
                                                  color: pColorL,
                                                  size: 35,
                                                )))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: gColorD,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: rColor,
                                                    size: 15,
                                                  ),
                                                ),
                                                Text(
                                                    "${widget.NoteData[index].timestamp}"),
                                                const Spacer(),
                                                const Icon(
                                                    Icons.file_upload_outlined)
                                              ],
                                            ),
                                            Text(
                                              "${widget.NoteData[index].title}",
                                              style: FontStyles.date,
                                            ),
                                            Text(
                                                "${widget.NoteData[index].content}"),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                const Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: rColor,
                                                    size: 15,
                                                  ),
                                                ),
                                                Text(
                                                    "${widget.NoteData[index].timestamp}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 75,
            width: double.infinity,
            decoration: const BoxDecoration(color: gColorD),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
