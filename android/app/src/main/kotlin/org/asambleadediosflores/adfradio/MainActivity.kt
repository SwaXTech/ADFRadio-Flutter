package org.asambleadediosflores.adfradio

import android.content.Intent
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import org.asambleadediosflores.adfradio.model.Data
import org.asambleadediosflores.adfradio.model.MetadataListener
import org.asambleadediosflores.adfradio.model.Song
import org.asambleadediosflores.adfradio.platformChannel.InfoAPI
import org.asambleadediosflores.adfradio.platformChannel.LogAPI
import org.asambleadediosflores.adfradio.platformChannel.receivePlatformChannelMessage
import org.asambleadediosflores.adfradio.service.AudioPlayerService
import org.asambleadediosflores.adfradio.util.stop


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
                api.sendMetadata(Data.currentSong.getArtist()!!, Data.currentSong.getTitle()!!)
            }
        }
        Song.addEventListener(listener!!)
        
    }

    override fun onDestroy() {
        super.onDestroy()
        stop(this, player!!)
    }
    
}
