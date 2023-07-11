import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/data/i_app_service.dart';
import 'package:vice_ser_oeg/domain/entities/main_screen_entity.dart';
import 'package:vice_ser_oeg/domain/entities/tile_link.dart';
import 'package:vice_ser_oeg/domain/repositories/i_app_repository.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';

class NetworkAppRepository implements IAppRepository {
  NetworkAppRepository(this.service);
  IAppService service;
  num worldDimensPixel = AppResources.valueTileSize;
  Image? image;
  @override
  search(String latitude, String longitude, String zoom) {
    final coordsX = double.tryParse(latitude) ?? 0;
    final coordsY = double.tryParse(longitude) ?? 0;
    final z = int.tryParse(zoom) ?? 0;
    worldDimensPixel = pow(2, z + 8);
    final tileY =
        (_longitudeToPixel(coordsY) / AppResources.valueTileSize).round();
    final tileX =
        (_latitudeToPixel(coordsX) / AppResources.valueTileSize).round();
    try {
      image = service.load(TileLink(x: tileX, y: tileY, z: z).url);
    } catch (e, st) {
      rethrow;
    }
    final xyz = (tileX, tileY, z);
    return MainScreenEntity(xyz, image);
  }

  double _longitudeToPixel(double longitude) =>
      (longitude * worldDimensPixel) / 360;
  double _latitudeToPixel(double latitude) =>
      (latitude * worldDimensPixel) / 180;
}
