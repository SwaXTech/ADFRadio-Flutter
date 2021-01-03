package org.asambleadediosflores.adfradio

import android.util.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

class InfoAPI (val flutterView: FlutterView){
    val INFOCHANNEL = "/info"
    val METADATA = "metadata"

    private fun sendMessage(method: String, arguments: Any? = null){
        Log.d("INFOAPI", "Sending message!")
        return MethodChannel(flutterView, INFOCHANNEL).invokeMethod(method, arguments)
    }

    fun sendMetadata(artist: String, title: String){
        sendMessage(METADATA, arrayListOf(artist, title))
    }
}

