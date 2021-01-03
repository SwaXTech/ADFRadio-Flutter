package org.asambleadediosflores.adfradio

import java.util.*

interface MetadataListener : EventListener {
    fun onSongChanged()
}