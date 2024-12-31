import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/news/bindings/photo_bindings.dart';
import 'modules/news/views/photos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sm Task2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: Photos(),
      initialBinding: PhotoBindings(),


    );
  }
}
