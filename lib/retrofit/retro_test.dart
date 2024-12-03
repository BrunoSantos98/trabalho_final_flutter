import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'retro_test.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/tasks')
  Future<List<Task>> getTasks();
}

@JsonSerializable()
class Task {
  const Task({required this.name});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}