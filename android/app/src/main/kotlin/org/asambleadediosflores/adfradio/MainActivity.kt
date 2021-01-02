package org.asambleadediosflores.adfradio

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity() : FlutterActivity() {
    private val CHANNEL = "asambleadediosflores.org/radio"

    private var player: Intent? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        player = Intent(this, AudioPlayerService::class.java)

        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            Log.d("Platform Channel", "Called!!!! " + call.method +  " ")
            val function = toggleRadioState(call)
            function(this, player!!)
        }
        
    }

    override fun onDestroy() {
        super.onDestroy()
        stop(this, player!!)
    }

    private fun toggleRadioState(call: MethodCall): (Context, Intent) -> Unit {
        return when(call.method){
            "play" -> ::play
            else     -> ::stop
        }
    }
}
