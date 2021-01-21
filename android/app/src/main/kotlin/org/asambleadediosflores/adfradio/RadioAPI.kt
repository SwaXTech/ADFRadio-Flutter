package org.asambleadediosflores.adfradio

import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

val RADIOCHANNEL = "/radio"
val PLAY = "play"
val STOP = "stop"
val ISPLAYING = "isPlaying"

fun receivePlatformChannelMessage(context: Context, player: Intent, flutterView: FlutterView) {
    MethodChannel(flutterView, RADIOCHANNEL).setMethodCallHandler { call, result ->
        log(call, context, player)
        when(call.method){
            PLAY -> play(context, player)
            STOP -> stop(context, player)
            ISPLAYING -> result.success(isPlaying(context, player))
        }
    }
    
}

private fun log(call: MethodCall, context: Context, player: Intent) {
    LogAPI.info("[Radio API] -> Received message: ${call.method} ${
        if (call.method == ISPLAYING) ": ${isPlaying(context, player)}" else ""
    }")
}