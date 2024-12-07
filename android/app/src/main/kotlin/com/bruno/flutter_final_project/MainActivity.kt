package com.bruno.flutter_final_project

import android.content.Intent
import android.provider.Telephony.Mms.Intents
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    private val CHANNEL = "com.bruno.flutter_final_project";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{ call, result ->
            if (call.method == "shareAdvice"){
                val advice = call.argument<String>("advice")
                if(advice != null){
                    shareText(advice)
                    result.success(null)
                }else{
                    result.error("Argumento invalido", "Advice está nulo", null)
                }
            }else{
                result.notImplemented()
            }
        }
    }

    private fun shareText(text: String){
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "text/plain"
            putExtra(Intent.EXTRA_TEXT, text)
        }
        startActivity(Intent.createChooser(intent, "Compartilhjar conselho"))
    }
}
