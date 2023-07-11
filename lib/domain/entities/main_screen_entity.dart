import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/ui/components/error_widget/app_error_widget.dart';

final class MainScreenEntity {
  const MainScreenEntity(this.xyz, this.image);
  MainScreenEntity.initial()
      : xyz = (0, 0, 0),
        image = const AppErrorWidget();
  final (int, int, int) xyz;
  final Widget image;
}
