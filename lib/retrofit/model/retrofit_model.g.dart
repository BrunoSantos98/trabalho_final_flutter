// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdviceResponse _$AdviceResponseFromJson(Map<String, dynamic> json) =>
    AdviceResponse(
      slip: json['slip'] == null
          ? null
          : Slip.fromJson(json['slip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdviceResponseToJson(AdviceResponse instance) =>
    <String, dynamic>{
      'slip': instance.slip,
    };

Slip _$SlipFromJson(Map<String, dynamic> json) => Slip(
      advice: json['advice'] as String?,
    );

Map<String, dynamic> _$SlipToJson(Slip instance) => <String, dynamic>{
      'advice': instance.advice,
    };
