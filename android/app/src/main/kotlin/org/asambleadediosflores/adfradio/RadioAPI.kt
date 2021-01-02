package org.asambleadediosflores.adfradio

import android.content.Context
import android.content.Intent
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

val CHANNEL = "/radio"
val PLAY = "play"
val STOP = "stop"
val ISPLAYING = "isPlaying"

fun receivePlatformChannelMessage(context: Context, player: Intent, flutterView: FlutterView) {
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
        Log.d("Platform Channel", "Called!!!! " + call.method + " ")
        
        when(call.method){
            
            PLAY -> play(context, player)
            STOP -> stop(context, player)
            ISPLAYING -> result.success(isPlaying(context, player))
        }
    }
}