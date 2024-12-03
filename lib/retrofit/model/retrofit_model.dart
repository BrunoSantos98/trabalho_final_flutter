import 'package:json_annotation/json_annotation.dart';
part 'retrofit_model.g.dart';

@JsonSerializable()
class AdviceResponse{

  const AdviceResponse({this.slip});

  factory AdviceResponse.fromJson(Map<String, dynamic> json) => _$AdviceResponseFromJson(json);

  final Slip? slip;

    Map<String, dynamic> toJson() => _$AdviceResponseToJson(this);
  }


@JsonSerializable()
class Slip{
  const Slip({this.advice});

  factory Slip.fromJson(Map<String, dynamic> json) => _$SlipFromJson(json);

  final String? advice;

  Map<String, dynamic> toJson() => _$SlipToJson(this);
}
// {"slip": { "id": 58, "advice": "Don't give a speech. Put on a show."}}