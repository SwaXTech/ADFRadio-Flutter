package org.asambleadediosflores.adfradio

import android.app.ActivityManager
import android.content.Context


fun isServiceRunning(context: Context, serviceClass: Class<*>): Boolean {
    val manager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
    manager.getRunningServices(Int.MAX_VALUE).forEach { service ->
        if (serviceClass.name == service.service.className) {
            return true
        }
    }
    return false
}