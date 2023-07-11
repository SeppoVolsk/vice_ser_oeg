import 'package:flutter/widgets.dart';
import 'package:vice_ser_oeg/data/i_app_service.dart';

class NetworkAppService implements IAppService {
  @override
  Image load(String source) {
    try {
      return Image.network(source);
    } catch (e, st) {
      rethrow;
    }
  }
}
