import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import 'add_note_screen.dart';
import 'custom_list_item.dart';
import 'one_note_screen.dart';

class DisplayNotes extends StatefulWidget {
  const DisplayNotes({super.key});
  @override
  State<DisplayNotes> createState() => _DisplayNotesState();
}

class _DisplayNotesState extends State<DisplayNotes> {
  Controller controller = Get.find();
  @override
  void initState() {
    controller.getNote();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  controller.getNote();
                  controller.switchTheme();
                },
                icon: controller.isDarkTheme.value
                    ? const Icon(
                        Icons.light_mode,
                        size: 30,
                      )
                    : const Icon(
                        Icons.dark_mode,
                        size: 30,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Get.to(const AddNoteScreen());
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            )
          ],
          title: const Text(
            "My Notes",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Obx(() => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  var note = controller.notes[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(NoteScreen(
                        title: note.title,
                        content: note.content,
                        id: index,
                      ));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: CustomListItem(
                          title: note.title,
                          content: note.content,
                        )),
                  );
                }))));
  }
}
