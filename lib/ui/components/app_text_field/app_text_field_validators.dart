import 'package:vice_ser_oeg/domain/resources/app_resources.dart';

String? Function(String?) selectValidator(String label) {
  return switch (label) {
    AppResources.stringLatitude => latitudeValidator,
    AppResources.stringLongitude => longitudeValidator,
    _ => commonValidator
  };
}

String? commonValidator(String? value) {
  final valueToDouble = double.tryParse(value ?? "");
  bool isNotEmptyValidator = value?.isEmpty == false;
  bool isDoubleValidator = valueToDouble != null;
  final errorMessages = {
    AppResources.stringRequiredFill: isNotEmptyValidator,
    AppResources.stringRequiredDouble: isDoubleValidator,
  };
  for (var entry in errorMessages.entries) {
    if (entry.value == false) {
      return entry.key;
    }
  }
  return null;
}

String? latitudeValidator(String? value) {
  final commonCheckResult = commonValidator(value);
  if (commonCheckResult == null) {
    final valueToDouble = double.tryParse(value ?? "");
    if (valueToDouble! > AppResources.valueLatitudeMax ||
        valueToDouble < AppResources.valueLatitudeMin) {
      return AppResources.stringLatNotInRange;
    }
    return null;
  }
  return commonCheckResult;
}

String? longitudeValidator(String? value) {
  final commonCheckResult = commonValidator(value);
  if (commonCheckResult == null) {
    final valueToDouble = double.tryParse(value ?? "");
    if (valueToDouble! > AppResources.valueLongitudeMax ||
        valueToDouble < AppResources.valueLongitudeMin) {
      return AppResources.stringLongNotInRange;
    }
    return null;
  }
  return commonCheckResult;
}
