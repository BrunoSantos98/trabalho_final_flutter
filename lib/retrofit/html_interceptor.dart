import 'dart:convert';
import 'package:dio/dio.dart';

class HtmlToJsonInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final html = response.data.toString();
    final jsonStart = html.indexOf('{');
    final jsonEnd = html.lastIndexOf('}');
    if (jsonStart != -1 && jsonEnd != -1) {
      final jsonString = html.substring(jsonStart, jsonEnd + 1);
      final jsonResponse = jsonDecode(jsonString);
      response.data = jsonResponse;
    }
    super.onResponse(response, handler);
  }
}
