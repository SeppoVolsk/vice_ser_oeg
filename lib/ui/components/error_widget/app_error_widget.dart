import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(AppResources.stringLoadError);
  }
}
