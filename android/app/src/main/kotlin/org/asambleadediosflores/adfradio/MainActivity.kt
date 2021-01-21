package org.asambleadediosflores.adfradio

import android.content.Intent
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity() : FlutterActivity() {

    private var player: Intent? = null
    private lateinit var api : InfoAPI
    private var listener: MetadataListener? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        player = Intent(this, AudioPlayerService::class.java)
        LogAPI.initPlaformChannel(flutterView)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        receivePlatformChannelMessage(this, player!!, flutterView)

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
