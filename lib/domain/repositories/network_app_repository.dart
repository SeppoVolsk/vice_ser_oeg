import 'dart:math';
import 'package:vice_ser_oeg/data/i_app_service.dart';
import 'package:vice_ser_oeg/domain/entities/main_screen_entity.dart';
import 'package:vice_ser_oeg/domain/entities/tile_link.dart';
import 'package:vice_ser_oeg/domain/repositories/i_app_repository.dart';

class NetworkAppRepository implements IAppRepository {
  const NetworkAppRepository(this.service);
  final IAppService service;

  @override
  MainScreenEntity search(String latitude, String longitude, String zoom) {
    final z = zoom.toInt();
    final (x, y) = _getMapTileFromCoordinates(
        latitude.toDouble(), longitude.toDouble(), z);
    final image = service.load(TileLink((x, y, z)).url);
    return MainScreenEntity((x, y, z), image);
  }

  _getMapTileFromCoordinates(
      final double aLat, final double aLon, final int zoom) {
    final double e2 = aLat * pi / 180;
    const sradiusa = 6378137, sradiusb = 6356752;
    final double j2 =
        sqrt(sradiusa * sradiusa - sradiusb * sradiusb) / sradiusa;
    final double m2 = log((1 + sin(e2)) / (1 - sin(e2))) / 2 -
        j2 * log((1 + j2 * sin(e2)) / (1 - j2 * sin(e2))) / 2;
    final b2 = (1 << zoom);
    final x = ((aLon + 180) / 360 * (1 << zoom)) ~/ 1;
    final y = (b2 / 2 - m2 * b2 / 2 / pi) ~/ 1;
    return (x, y);
  }
}

extension on String {
  double toDouble() => double.tryParse(this) ?? 0;
  int toInt() => int.tryParse(this) ?? 0;
}
