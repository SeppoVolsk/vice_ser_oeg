import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/data/i_app_service.dart';
import 'package:vice_ser_oeg/ui/components/error_widget/app_error_widget.dart';

class NetworkAppService implements IAppService {
  const NetworkAppService();
  @override
  Image load(String source) {
    return Image.network(
      source,
      errorBuilder: (context, error, stackTrace) => const AppErrorWidget(),
    );
  }
}
