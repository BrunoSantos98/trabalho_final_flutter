
import 'package:flutter/services.dart';

class ShareHelper{
  static const MethodChannel _channel = MethodChannel("com.bruno.flutter_final_project");

  static Future<void> shareAdvice(String advice) async{
    try{
      await _channel.invokeMethod('shareAdvice', {"advice": advice});
    } on PlatformException catch(e){
      print("Erro ao executar acao: ${e.message}");
    }
  }
}