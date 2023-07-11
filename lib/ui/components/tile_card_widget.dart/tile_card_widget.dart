import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';

import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen_model.dart';

class TileCardWidget extends StatelessWidget {
  const TileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MainScreenModelProvider.of(context)?.data;
    final (x, y, z) = data?.xyz ?? (0, 0, 0);
    final image = data?.image?.image;

    return Card(
      child: Column(
        children: [
          Text("x:$x y:$y zoom:$z"),
          const SizedBox(
            height: AppResources.dimensHeightBetween,
          ),
          image == null
              ? const Text(AppResources.stringLoadError)
              : Image(image: image),
        ],
      ),
    );
  }
}
