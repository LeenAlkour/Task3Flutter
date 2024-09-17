import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled3/view/display_notes.dart';

import 'controller/controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Controller controller = Get.put(Controller());
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
        theme:
            controller.isDarkTheme.value ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const DisplayNotes()));
  }
}
