import 'package:flutter/material.dart';

abstract final class AppResources {
  // Strings
  static const stringAppTitle = "Геосервис задание";
  static const stringLatitude = "Широта";
  static const stringLongitude = "Долгота";
  static const stringZoom = "Зум";
  static const stringRequiredFill = "Необходио заполнить";
  static const stringRequiredDouble = "Ожидается число с плавающей точкой";
  static const stringLatNotInRange =
      "Широты могут быть от ${AppResources.valueLatitudeMin} до ${AppResources.valueLatitudeMax} градусов";
  static const stringLongNotInRange =
      "Долготы могут быть от ${AppResources.valueLongitudeMin} до ${AppResources.valueLongitudeMax} градусов";
  static const stringLoadError = "Не удалось загрузить изображение";
  // Values
  static const valueLatitudeMax = 90;
  static const valueLatitudeMin = -90;
  static const valueLongitudeMax = 180;
  static const valueLongitudeMin = -180;
  static const valueTileSize = 256;
  static const valueInitialLatitude = 55.686889;
  static const valueInitialLongitude = 37.717747;
  static const valueInitialZoom = 16;
  // Dimens
  static const dimensHeightBetween = 16.0;
  static const dimensCircularRadius = 16.0;
  static const dimensTextFieldWidthFactor = 0.5;
  // Colors
  static const colorsSeedColor = Colors.deepPurple;
}
