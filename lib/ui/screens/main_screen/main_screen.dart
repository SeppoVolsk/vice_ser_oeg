import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/components/app_text_field/app_text_field.dart';
import 'package:vice_ser_oeg/ui/components/tile_card_widget.dart/tile_card_widget.dart';
import 'package:vice_ser_oeg/ui/screens/main_screen/main_screen_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controllerLatitude = TextEditingController()
    ..text = "${AppResources.valueInitialLatitude}";
  final controllerLongitude = TextEditingController()
    ..text = "${AppResources.valueInitialLongitude}";
  final controllerZoom = TextEditingController()
    ..text = "${AppResources.valueInitialZoom}";
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final model = MainScreenModelProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(AppResources.stringAppTitle),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: FractionallySizedBox(
            widthFactor: AppResources.dimensTextFieldWidthFactor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const TileCardWidget(),
                const SizedBox(
                  height: AppResources.dimensHeightBetween,
                ),
                AppTextField(
                    controller: controllerLatitude,
                    labelText: AppResources.stringLatitude),
                const SizedBox(
                  height: AppResources.dimensHeightBetween,
                ),
                AppTextField(
                    controller: controllerLongitude,
                    labelText: AppResources.stringLongitude),
                const SizedBox(
                  height: AppResources.dimensHeightBetween,
                ),
                AppTextField(
                    controller: controllerZoom,
                    labelText: AppResources.stringZoom)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            model?.search(
              controllerLatitude.text,
              controllerLongitude.text,
              controllerZoom.text,
            );
          }
        },
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
