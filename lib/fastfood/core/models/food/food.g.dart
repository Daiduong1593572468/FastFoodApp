// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      Id: json['Id'] as String,
      Name: json['Name'] as String,
      Rate: json['Rate'] as int,
      FoodType: json['FoodType'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Rate': instance.Rate,
      'FoodType': instance.FoodType,
      'image': instance.image,
    };
