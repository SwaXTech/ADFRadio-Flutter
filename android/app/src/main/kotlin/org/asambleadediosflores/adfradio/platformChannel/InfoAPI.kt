package org.asambleadediosflores.adfradio.platformChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

class InfoAPI (private val flutterView: FlutterView){
    private val INFOCHANNEL = "/info"
    private val METADATA = "metadata"

    private fun sendMessage(method: String, arguments: Any? = null){
        return MethodChannel(flutterView, INFOCHANNEL).invokeMethod(method, arguments)
    }

    fun sendMetadata(artist: String, title: String){
        LogAPI.info("[Info API] -> Sending Metadata: $title - $artist")
        sendMessage(METADATA, arrayListOf(title, artist))
    }
}

