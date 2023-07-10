import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/components/app_text_field/app_text_field.dart';
import 'package:vice_ser_oeg/ui/components/tile_card_widget.dart/tile_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controllerLatitude = TextEditingController();
  final controllerLongitude = TextEditingController();
  final controllerZoom = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Center(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {}
        },
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}