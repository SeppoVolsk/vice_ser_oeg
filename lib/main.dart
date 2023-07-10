import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/components/app_text_field/app_text_field.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppResources.stringAppTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(title: AppResources.stringAppTitle),
    );
  }
}
