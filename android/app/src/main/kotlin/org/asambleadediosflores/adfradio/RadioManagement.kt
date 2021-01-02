package org.asambleadediosflores.adfradio

import android.content.Context
import android.content.Intent
import android.util.Log
import com.google.android.exoplayer2.util.Util


fun play(context: Context, player: Intent){
    Util.startForegroundService(context, player)
}

fun stop(context: Context, player: Intent){
    context.stopService(player)
}

fun isPlaying(context: Context, player: Intent): Boolean{
    return isServiceRunning(context, AudioPlayerService::class.java)
}