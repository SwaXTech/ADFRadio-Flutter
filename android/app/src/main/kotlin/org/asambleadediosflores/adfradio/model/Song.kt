package org.asambleadediosflores.adfradio.model

import org.asambleadediosflores.adfradio.util.Converter
import java.util.*

class Song(private var title: String?, private var artist: String?) {
    private fun triggerSongNameEvent() {
        for (listener in listeners) {
            listener.onSongChanged()
        }
    }

    fun getTitle(): String? {
        return if (title == null || title != "") title else Data.defaultSongName
    }

    fun setTitle(title: String?) {
        this.title = title
        triggerSongNameEvent()
    }

    fun getArtist(): String? {
        return if (artist == null || artist != "") artist else Data.defaultArtistName
    }

    fun setArtist(artist: String?) {
        this.artist = artist
        triggerSongNameEvent()
    }
    
    fun setMetadata(text: String){
        val converter = Converter(text)
        this.setArtist(converter.artist)
        this.setTitle(converter.title)
    }

    companion object {
        private val listeners = ArrayList<MetadataListener>()
        fun addEventListener(listener: MetadataListener) {
            listeners.add(listener)
        }

        fun removeListener(listener: MetadataListener?) {
            listeners.remove(listener)
        }
    }
}