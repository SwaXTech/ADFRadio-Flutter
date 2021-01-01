package org.asambleadediosflores.adfradio

import android.app.Service
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.IBinder
import android.util.Log
import com.google.android.exoplayer2.C
import com.google.android.exoplayer2.ExoPlayerFactory
import com.google.android.exoplayer2.SimpleExoPlayer
import com.google.android.exoplayer2.audio.AudioAttributes
import com.google.android.exoplayer2.metadata.MetadataOutput
import com.google.android.exoplayer2.source.MediaSource
import com.google.android.exoplayer2.source.ProgressiveMediaSource
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory
import com.google.android.exoplayer2.util.Util

class AudioPlayerService : Service() {
    var player: SimpleExoPlayer? = null
    private var dataSourceFactory: DefaultDataSourceFactory? = null
    private var mediaSource: MediaSource? = null
    private val type = 0
    override fun onCreate() {
        super.onCreate()
        val context: Context = this
        val audioAttributes = AudioAttributes.Builder()
                .setUsage(C.USAGE_MEDIA)
                .setContentType(C.CONTENT_TYPE_MUSIC)
                .build()
        player = ExoPlayerFactory.newSimpleInstance(context, DefaultTrackSelector())

        player?.setAudioAttributes(audioAttributes,  /* handleAudioFocus= */true)
        player?.addMetadataOutput(MetadataOutput { metadata ->
            Log.i("Metadata:", "Info: " + metadata[0])
            if (metadata.length() != 0) { // TODO: Extraer info
                com.google.android.exoplayer2.util.Log.i("Exoplayer INFO", metadata[0].toString())
            }
        })
        dataSourceFactory = DefaultDataSourceFactory(
                context,  //TODO: Abstraer ADF Radio
                Util.getUserAgent(context, "ADFRadio")
        )
    }

    override fun onDestroy() {
        player!!.release()
        player = null
        super.onDestroy()
    }

    override fun onBind(intent: Intent): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
        mediaSource = ProgressiveMediaSource.Factory(dataSourceFactory).createMediaSource(Uri.parse("https://adfradio.com.ar/radio/8000/live"))
        player!!.prepare(mediaSource)
        player!!.playWhenReady = true
        return START_STICKY
    }

}