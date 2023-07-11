import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/entities/main_screen_entity.dart';
import 'package:vice_ser_oeg/domain/repositories/i_app_repository.dart';

class MainScreenModel extends ChangeNotifier {
  MainScreenModel(this.repository);
  final IAppRepository repository;

  var data = const MainScreenEntity();

  void search(String latitude, String longitude, String zoom) {
    try {
      data = repository.search(latitude, longitude, zoom);
    } catch (e, st) {}
    notifyListeners();
  }
}

class MainScreenModelProvider extends InheritedNotifier<MainScreenModel> {
  final MainScreenModel model;

  const MainScreenModelProvider(
      {super.key, required this.model, required Widget child})
      : super(notifier: model, child: child);

  static MainScreenModel? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<MainScreenModelProvider>()
      ?.model;
}
