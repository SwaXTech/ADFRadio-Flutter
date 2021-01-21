package org.asambleadediosflores.adfradio.util

import org.asambleadediosflores.adfradio.model.Data

/**
 * La siguiente clase separa un texto con la forma Artista - Título */
class Converter(currentsong: String) {
    var title: String? = null
    var artist: String? = null

    fun extractSongTitle(string: String): String {
        return if (string.contains("\"")) string.split("\"").toTypedArray()[1] else ""
    }

    init {
        var divider = 0
        val text = extractSongTitle(currentsong)
        if (text.isNotEmpty()) {
            for (i in text.indices) {
                if (text[i] == '-') {
                    divider = i
                }
            }
            if (divider != 0) {
                artist = text.substring(0, divider - 1)
                title = text.substring(divider + 2)
            } else {
                artist = Data.defaultArtistName
                title = text
            }
        } else {
            artist = Data.defaultArtistName
            title = Data.defaultSongName
        }
    }
}