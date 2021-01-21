package org.asambleadediosflores.adfradio.platformChannel

import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView
import org.asambleadediosflores.adfradio.util.isPlaying
import org.asambleadediosflores.adfradio.util.play
import org.asambleadediosflores.adfradio.util.stop

const val RADIOCHANNEL = "/radio"
const val PLAY = "play"
const val STOP = "stop"
const val ISPLAYING = "isPlaying"

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