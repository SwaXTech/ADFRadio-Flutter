package org.asambleadediosflores.adfradio

import android.content.Context
import android.content.Intent
import android.util.Log
import com.google.android.exoplayer2.util.Util


fun play(context: Context, player: Intent){ 
    Log.d("RadioManagement", "Starting...")
    Util.startForegroundService(context, player)
    Log.d("RadioManagement", "Is running: " +  isPlaying(context, player))
    
}

fun stop(context: Context, player: Intent){
    context.stopService(player)
}

fun isPlaying(context: Context, player: Intent): Boolean{
    return isServiceRunning(context, AudioPlayerService::class.java)
}