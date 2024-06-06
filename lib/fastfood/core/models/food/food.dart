import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'food.freezed.dart';
part 'food.g.dart';

@Freezed()
class Food with _$Food {
  const factory Food({
    required String Id,
    required String Name,
    required int Rate,
    required String FoodType,
    required String image,
  }) = _Food;

  factory Food.fromJson(Map<String, Object?> json) => _$FoodFromJson(json);
}
