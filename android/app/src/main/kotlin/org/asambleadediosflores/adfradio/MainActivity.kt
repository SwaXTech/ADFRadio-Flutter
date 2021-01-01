package org.asambleadediosflores.adfradio

import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity() : FlutterActivity() {
    private val CHANNEL = "asambleadediosflores.org/radio"

    private val player: Intent? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            Log.d("Platform Channe", "Called!!!!")
        }
    }
}
