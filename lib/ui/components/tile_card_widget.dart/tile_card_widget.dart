import 'package:flutter/material.dart';

class TileCardWidget extends StatelessWidget {
  const TileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
          "https://core-carparks-renderer-lots.maps.yandex.net/maps-rdr-carparks/tiles?l=carparks&x=316898&y=164368&z=19&scale=1&lang=ru_RU"),
    );
  }
}
