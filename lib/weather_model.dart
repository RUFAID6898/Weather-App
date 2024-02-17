import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
abstract class Weather with _$Weather {
  factory Weather({
    required double temperature,
    required String condition,
    required String location,
  }) = _Weather;
}
