import 'package:flutter/material.dart';

class Note {
  String title;
  String content;
  Note({
    required this.title,
    required this.content,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
    );
  }
}
