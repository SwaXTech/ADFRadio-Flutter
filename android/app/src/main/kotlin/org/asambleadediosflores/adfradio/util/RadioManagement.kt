package org.asambleadediosflores.adfradio.util

import android.content.Context
import android.content.Intent
import com.google.android.exoplayer2.util.Util
import org.asambleadediosflores.adfradio.service.AudioPlayerService


fun play(context: Context, player: Intent){
    Util.startForegroundService(context, player)
}

fun stop(context: Context, player: Intent){
    context.stopService(player)
}

fun isPlaying(context: Context, player: Intent): Boolean{
    return isServiceRunning(context, AudioPlayerService::class.java)
}