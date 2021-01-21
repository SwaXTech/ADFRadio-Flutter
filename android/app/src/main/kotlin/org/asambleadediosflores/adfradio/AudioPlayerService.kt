package org.asambleadediosflores.adfradio

import android.app.*
import android.app.Notification.MediaStyle
import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.os.IBinder
import com.google.android.exoplayer2.*
import com.google.android.exoplayer2.Player.EventListener
import com.google.android.exoplayer2.analytics.AnalyticsListener
import com.google.android.exoplayer2.audio.AudioAttributes
import com.google.android.exoplayer2.audio.AudioListener
import com.google.android.exoplayer2.audio.AudioRendererEventListener
import com.google.android.exoplayer2.metadata.MetadataOutput
import com.google.android.exoplayer2.source.MediaSource
import com.google.android.exoplayer2.source.ProgressiveMediaSource
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory
import com.google.android.exoplayer2.util.Log
import com.google.android.exoplayer2.util.Util


class AudioPlayerService : Service() {
    var player: SimpleExoPlayer? = null
    private var dataSourceFactory: DefaultDataSourceFactory? = null
    private var mediaSource: MediaSource? = null
    private var builder: Notification.Builder? = null
    private var noti: Notification? = null
    private var manager: NotificationManager? = null
    private val NOTIFICATION_ID = 777
    private val CHANNEL_ID = "CID"
    private var listener: MetadataListener? = null

    override fun onCreate() {
        startForeground()
        Log.setLogLevel(Log.LOG_LEVEL_INFO) // Log de exoplayer
        LogAPI.info("[ExoPlayer] -> Creating Service")
        LogAPI.debug("[ExoPlayer] -> Exoplayer´s log level: ${Log.getLogLevel()}")
        super.onCreate()
        val context: Context = this
        val audioAttributes = AudioAttributes.Builder()
                .setUsage(C.USAGE_MEDIA)
                .setContentType(C.CONTENT_TYPE_MUSIC)
                .build()
        player = ExoPlayerFactory.newSimpleInstance(context, DefaultTrackSelector())

        player?.setAudioAttributes(audioAttributes,  /* handleAudioFocus= */true)
        player?.addMetadataOutput { metadata ->
            if (metadata.length() != 0) {
                LogAPI.debug("[ExoPlayer] -> Metadata detected: $metadata")
                currentSong.setMetadata(metadata[0].toString())
            }
        }

        dataSourceFactory = DefaultDataSourceFactory(
                context,  //TODO: Abstraer ADF Radio
                Util.getUserAgent(context, "ADFRadio")
        )

        
        
    }

    private fun startForeground() {

        val logoBitmap = BitmapFactory.decodeResource(resources, R.drawable.boton)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val goApp = Intent(this, MainActivity::class.java)
            val openActivity = PendingIntent.getActivity(applicationContext, 0, goApp, 0)
            builder = Notification.Builder(this)
            builder!!.setSmallIcon(R.drawable.boton)
            builder!!.setContentTitle("ADFRadio")
            builder!!.setContentText("Asamblea de Dios Flores")
            builder!!.setLargeIcon(logoBitmap)
            builder!!.setStyle(MediaStyle())
            builder!!.setContentIntent(openActivity)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                builder!!.setChannelId(CHANNEL_ID)
            }
            noti = builder!!.build()
            manager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val notificationChannel = NotificationChannel(CHANNEL_ID, "NOTI", NotificationManager.IMPORTANCE_MIN)

                //Las siguientes dos lineas de código son para que no vibre en 8.0.
                notificationChannel.vibrationPattern = longArrayOf(0)
                notificationChannel.enableVibration(true)
                manager!!.createNotificationChannel(notificationChannel)
            }
            manager!!.notify(NOTIFICATION_ID, noti)
            startForeground(NOTIFICATION_ID, noti) //AGREGADO PARA 8.0
        }

        listener = object : MetadataListener {
            override fun onSongChanged() {
                builder!!.setContentTitle(currentSong.getTitle())
                builder!!.setContentText(currentSong.getArtist())
                noti = builder!!.build()
                manager!!.notify(NOTIFICATION_ID, noti)
            }
        }

        Song.addEventListener(listener!!)
    }

    override fun onDestroy() {
        player!!.release()
        player = null
        Song.removeListener(listener!!)
        LogAPI.info("[ExoPlayer] -> Destroying service")
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