import 'dart:math';
import 'package:vice_ser_oeg/data/i_app_service.dart';
import 'package:vice_ser_oeg/domain/entities/main_screen_entity.dart';
import 'package:vice_ser_oeg/domain/entities/tile_link.dart';
import 'package:vice_ser_oeg/domain/repositories/i_app_repository.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';

class NetworkAppRepository implements IAppRepository {
  const NetworkAppRepository(this.service);
  final IAppService service;

  @override
  MainScreenEntity search(String latitude, String longitude, String zoom) {
    final z = zoom.toInt();
    final worldSizeInPixels = pow(2, z + 8);
    final x =
        _toTileCoord(_latitudeToPixel(latitude.toDouble(), worldSizeInPixels));
    final y = _toTileCoord(
        _longitudeToPixel(longitude.toDouble(), worldSizeInPixels));
    final image = service.load(TileLink((x, y, z)).url);
    return MainScreenEntity((x, y, z), image);
  }

  int _toTileCoord(double pixels) => (pixels ~/ AppResources.valueTileSize);
  double _longitudeToPixel(double longitude, num worldSizeInPixels) =>
      (longitude * worldSizeInPixels) / 360;
  double _latitudeToPixel(double latitude, worldSizeInPixels) =>
      (latitude * worldSizeInPixels) / 180;
}

extension on String {
  double toDouble() => double.tryParse(this) ?? 0;
  int toInt() => int.tryParse(this) ?? 0;
}
