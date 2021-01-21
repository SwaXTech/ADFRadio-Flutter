package org.asambleadediosflores.adfradio.model

import java.util.*

interface MetadataListener : EventListener {
    fun onSongChanged()
}