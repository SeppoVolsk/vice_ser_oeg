import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/data/network_app_service.dart';
import 'package:vice_ser_oeg/domain/repositories/network_app_repository.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen_model.dart';

class MainScreenBuilder extends StatelessWidget {
  const MainScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = NetworkAppRepository(NetworkAppService());
    final model = MainScreenModel(repository);
    return MaterialApp(
      title: AppResources.stringAppTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreenModelProvider(model: model, child: const MainScreen()),
    );
  }
}
