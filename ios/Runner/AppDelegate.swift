import UIKit
import Flutter
import os

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, FRadioPlayerDelegate {

     private var isPlaying = false
     private let loading_finished = FRadioPlayerState.loadingFinished.description
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
    
    
   
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let radioChannel = FlutterMethodChannel(name: "asambleadediosflores.org/radio", binaryMessenger: controller as! FlutterBinaryMessenger)
           
        radioChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: FlutterResult) -> Void in
            os_log("This is a default message.")
            let player = FRadioPlayer.shared
            player.delegate = self
            player.radioURL = URL(string: "https://adfradio.com.ar/radio/8000/live")
            player.play()
            self.isPlaying = true
        })

    
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {}
    
    // Al terminar de cargar, aunque no esté reproduciendo, el player queda pausado y al darle play
    // queda retrasado con respecto al live. Por lo tanto decidí que cuando termina de cargar
    // darle un stop forzoso con el objetivo de que cuando se de play quede al final de la transmisión
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        if loadingFinished(state) && !isPlaying {
            player.stop()
        }
    }
    
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange artistName: String?, trackName: String?) {
        
        let metadata = "\n \(artistName ?? "Unknown") -  + \(trackName ?? "Unknown")"
    
        
        if hasMetadata(trackName, artistName) && player.isPlaying{
            os_log("FRadioPlayer: Metadata updated")
        } else {
            os_log("FRadioPlayer: Metadata updated")
        }
    }
    
    private func loadingFinished(_ state: FRadioPlayerState) -> Bool {
        return state.description == loading_finished
    }
    
    private func refreshLabels(_ trackName: String?, _ artistName: String?) {
        // Los nombres de las canciones llegan como: Artista - Titulo[basura]
        // por lo tanto al separarlo por '[' ignoro la basura y me quedo con el título.
        let songname = trackName?.components(separatedBy: "[")[0] ?? "Unknown"
        let meta = "\n \(songname)"
        os_log("FRadioPlayer: Metadata updated")
    }
    
    private func hasMetadata(_ trackName: String?, _ artistName: String?) -> Bool {
        return trackName != nil && artistName != nil
    }
    
}


