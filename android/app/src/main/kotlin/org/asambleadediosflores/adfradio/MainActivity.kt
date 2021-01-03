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

    private var player: Intent? = null
    private lateinit var api : InfoAPI
    private var listener: MetadataListener? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        player = Intent(this, AudioPlayerService::class.java)

        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        receivePlatformChannelMessage(this, player!!, flutterView)
        //flutterView_ = flutterView

        api = InfoAPI(flutterView)
        listener = object : MetadataListener {
            override fun onSongChanged() {
                api.sendMetadata(currentSong.getArtist()!!, currentSong.getTitle()!!)
            }
        }
        Song.addEventListener(listener!!)
        
    }

    override fun onDestroy() {
        super.onDestroy()
        stop(this, player!!)
    }
    
}
