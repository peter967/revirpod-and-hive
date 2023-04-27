// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entry _$$_EntryFromJson(Map<String, dynamic> json) => _$_Entry(
      id: json['id'] as int,
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
      entryAt: DateTime.parse(json['entryAt'] as String),
    );

Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'id': instance.id,
      'food': instance.food,
      'entryAt': instance.entryAt.toIso8601String(),
    };
