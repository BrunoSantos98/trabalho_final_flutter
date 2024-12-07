import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/retrofit_model.dart';

part 'retrofit_config.g.dart';

@RestApi(baseUrl: 'https://api.adviceslip.com')
abstract class RestAdviceClient{
  factory RestAdviceClient(Dio dio, {String? baseUrl}) = _RestAdviceClient;

  @GET('/advice')
  Future<AdviceResponse> getAdvice();
}