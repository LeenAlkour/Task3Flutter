import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

class NoteScreen extends StatefulWidget {
  int id;
  String title;
  String content;
  NoteScreen({
    super.key,
    required this.id,
    required this.title,
    required this.content,
  });
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();

    TextEditingController controllerTitle =
        TextEditingController(text: widget.title);
    TextEditingController controllerContent =
        TextEditingController(text: widget.content);
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controllerTitle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                controller.deleteNote(widget.id);
                Get.back();
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                controller.editNote(widget.id, controllerTitle.value.text,
                    controllerContent.value.text);
                Get.back();
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextFormField(
            maxLines: 10,
            minLines: 1,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            controller: controllerContent,
          )),
    );
  }
}
