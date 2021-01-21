package org.asambleadediosflores.adfradio.platformChannel

import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

object LogAPI {

    private const val LOGCHANNEL = "/log"
    private const val ERROR = "error"
    private const val WARNING = "warning"
    private const val WTF = "whatTheFailure"
    private const val INFO = "info"
    private const val DEBUG = "debug"
    private lateinit var platformChannel: MethodChannel;

    fun initPlaformChannel(flutterView: FlutterView) {
       platformChannel = MethodChannel(flutterView, LOGCHANNEL)
    }

    private fun sendMessage(method: String, arguments: Any? = null){
        return platformChannel.invokeMethod(method, "[Android] -> $arguments")
    }


    fun debug(msg: String){
        sendMessage(DEBUG, msg)
    }

    fun info(msg: String){
        sendMessage(INFO, msg)
    }

    fun wtf(msg: String){
        sendMessage(WTF, msg)
    }

    fun error(msg: String){
        sendMessage(ERROR, msg)
    }

    fun warning(msg: String){
        sendMessage(WARNING, msg)
    }



}