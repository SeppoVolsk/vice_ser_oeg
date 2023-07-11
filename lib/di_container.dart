import 'package:vice_ser_oeg/data/network_app_service.dart';
import 'package:vice_ser_oeg/domain/repositories/network_app_repository.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen_model.dart';

class _DiContainer {
  _DiContainer();
  static const service = NetworkAppService();
  static const repository = NetworkAppRepository(service);
  final model = MainScreenModel(repository);
}

final di = _DiContainer();
