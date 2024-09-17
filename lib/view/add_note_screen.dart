import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  build(BuildContext context) {
    Controller controller = Get.find();
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerContent = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controllerTitle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.addNote(
                      controllerContent.value.text, controllerTitle.value.text);
                  Get.back();
                }
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a content';
                }
                return null;
              },
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: "write your note",
                border: InputBorder.none,
              ),
              controller: controllerContent,
            )),
      ),
    );
  }
}
