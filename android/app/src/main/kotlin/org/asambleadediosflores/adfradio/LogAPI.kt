package org.asambleadediosflores.adfradio

import android.util.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView

object LogAPI {

    private val LOGCHANNEL = "/log"
    private val ERROR = "error"
    private val WARNING = "warning"
    private val WTF = "whatTheFailure"
    private val INFO = "info"
    private val DEBUG = "debug"
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