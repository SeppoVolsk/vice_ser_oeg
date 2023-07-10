import 'package:flutter/material.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/components/app_text_field/app_text_field_validators.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: selectValidator(labelText),
      maxLines: 1,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppResources.dimensCircularRadius)),
      ),
    );
  }
}
