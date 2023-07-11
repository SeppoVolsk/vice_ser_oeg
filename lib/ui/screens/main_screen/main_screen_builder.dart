import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/di_container.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen_model.dart';

class MainScreenBuilder extends StatelessWidget {
  const MainScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppResources.stringAppTitle,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppResources.colorsSeedColor),
        useMaterial3: true,
      ),
      home: MainScreenModelProvider(
          model: di.model
            ..search(
                "${AppResources.valueInitialLatitude}",
                "${AppResources.valueInitialLongitude}",
                "${AppResources.valueInitialZoom}"),
          child: const MainScreen()),
    );
  }
}
