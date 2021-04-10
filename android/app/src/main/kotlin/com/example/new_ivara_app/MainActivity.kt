package com.example.new_ivara_app

import android.content.Intent
import androidx.annotation.NonNull
//import com.unity3d.player.UnityPlayerActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // Note: this method is invoked on the main thread.
            // TODO
            if(call.method.equals("openUnityClass6")){
                openUnityClass6(call.argument<Int>("arguments"));

            }else if(call.method.equals("openUnityClass7")){
                openUnityClass7();
            }
            else{
                result.notImplemented();
            }
        }
    }
    fun openUnityClass6(arguments: Int?){
//         var intent = Intent(this, UnityPlayerActivity::class.java);
//         intent.putExtra("arguments",arguments);
//         startActivity(intent);
    }
    fun openUnityClass7(){
      //  var intent = Intent(this, UnityPlayerActivity::class.java);
      //  intent.putExtra("arguments",2);
      //  startActivity(intent);
    }
}
