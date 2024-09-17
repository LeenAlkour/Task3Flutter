
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/note.dart';

class Controller extends GetxController {
  final box = GetStorage();
  RxBool isDarkTheme = false.obs;
  RxList<Note> notes = <Note>[].obs;
// Function to change the theme to dark or light

  void switchTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    box.write('isDarkTheme', isDarkTheme.value);
  }

  @override
  void onInit() {
    super.onInit();
    isDarkTheme.value = box.read('isDarkTheme') ?? false;

    getNote();
  }
  // Function to get the list notes from storage(if exist)

  void getNote() {
    List<dynamic> notesJson = box.read<List<dynamic>>('notes') ?? [];
    notes.value = notesJson
        .map((json) => Note.fromJson(json as Map<String, dynamic>))
        .toList();
  }
  // Function to add a note to the notes list and add it to storage

  void addNote(String content, String title) {
    title =
        title.isNotEmpty == true ? title : generateTitleFromContent(content);

    notes.add(Note(content: content, title: title));
    StorageNotes(notes);
  }

  // Function to delete a note from the notes list and delete it from storage
  void deleteNote(int id) {
    notes.removeAt(id);
    StorageNotes(notes);
  }

// Function to change the title or content of the note

  void editNote(int id, String title, String content) {
    notes[id].title = title;
    notes[id].content = content;
    notes.refresh();
    StorageNotes(notes);
  }
// Function to generates the title of the note from its content if the title is not entered

  String generateTitleFromContent(String content) {
    List<String> words = content.split(' ');

    if (words.length < 3) {
      return words.join(' ');
    }
    return words.sublist(0, 3).join(' ');
  }
// Function to storage notes in device

  void StorageNotes(List<Note> notes) {
    List<Map<String, dynamic>> notesJson =
        notes.map((Note) => Note.toJson()).toList();
    box.write('notes', notesJson);
  }
}
