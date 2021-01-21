import UIKit
import Flutter
import os

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate{
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let log = LogAPI(window: window)
        
        let infoApi: InfoAPI = InfoAPI(window: window, log: log)
        
        let radio = Radio(infoApi: infoApi)
        _ = RadioAPI(window: window, radio: radio)
        
        
        
        
    
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }

}


class Radio: FRadioPlayerDelegate{
    
    private let loading_finished = FRadioPlayerState.loadingFinished.description
    private let player: FRadioPlayer
    private var infoApi: InfoAPI
    
    init(infoApi: InfoAPI) {
        
        self.infoApi = infoApi
        player = FRadioPlayer.shared
        player.delegate = self
        player.isAutoPlay = false
        player.enableArtwork = false
        player.radioURL = URL(string: "https://adfradio.com.ar/radio/8000/live")
        
        
    }
    
    func play(){
        player.play()
    }
    
    func stop(){
        player.stop()
    }
    
    func isPlaying() -> Bool{
        return player.isPlaying
    }
    
    private func loadingFinished(_ state: FRadioPlayerState) -> Bool {
        return state.description == loading_finished
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {}
       
   // Al terminar de cargar, aunque no esté reproduciendo, el player queda pausado y al darle play
   // queda retrasado con respecto al live. Por lo tanto decidí que cuando termina de cargar
   // darle un stop forzoso con el objetivo de que cuando se de play quede al final de la transmisión
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        if loadingFinished(state) && !player.isPlaying {
            player.stop()
        }
    }
       
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange artistName: String?, trackName: String?) {
       
        if hasMetadata(trackName, artistName) && player.isPlaying{
            os_log("FRadioPlayer: Metadata updated")
            let songname = trackName?.components(separatedBy: "[")[0]
            infoApi.sendMetadata(title: songname!, artist: artistName!)
        } else {
           os_log("FRadioPlayer: No metadata")
        }
    }
    
    private func hasMetadata(_ trackName: String?, _ artistName: String?) -> Bool {
        return trackName != nil && artistName != nil
    }
}


class RadioAPI{
    
    private let CHANNEL = "/radio"
    private let PLAY = "play"
    private let STOP = "stop"
    private let ISPLAYING = "isPlaying"
    
    init(window: UIWindow, radio: Radio, log: LogAPI) {
        let controller : FlutterViewController = window.rootViewController as! FlutterViewController
        let radioChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller as! FlutterBinaryMessenger)
           
        radioChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            switch call.method{
                case self.PLAY:
                    log.info(msg: "[Radio API] -> Starting Radio")
                    radio.play()
                    break
                case self.STOP:
                    log.info(msg: "[Radio API] -> Stopping Radio")
                    radio.stop()
                    break
                case self.ISPLAYING:
                    
                    let isPlaying = Bool(radio.isPlaying())
                    let msg = isPlaying ? "Radio is Playing" : "Radio is not playing"
                    
                    log.info(msg: "[Radio API] -> Sending radio status: \(msg)")
                    result(isPlaying)
                default:
                    break
            }
            
        })
    }
    
    
}

class InfoAPI{
    private let CHANNEL = "/info"
    private let METADATA = "metadata"
    private var controller: FlutterViewController
    private var infoChannel: FlutterMethodChannel
    private let log: LogAPI;
    
    init(window: UIWindow, log: LogAPI) {
        controller = window.rootViewController as! FlutterViewController
        infoChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller as! FlutterBinaryMessenger)
        
        self.log = log;
    }
    
    func sendMetadata(title: String, artist: String){
        log.info(msg: "[Info API] -> Sending Metadata: \(title) - \(artist) ")
        infoChannel.invokeMethod(METADATA, arguments: [title, artist])
    }
    
}


class LogAPI{
    
    private static let CHANNEL = "/log"
    private static let ERROR = "error"
    private static let WARNING = "warning"
    private static let WTF = "whatTheFailure"
    private static let DEBUG = "debug"
    private static let INFO = "info"
    
    private var controller: FlutterViewController
    private var logChannel: FlutterMethodChannel
    
    init(window: UIWindow) {
        controller = window.rootViewController as! FlutterViewController
        logChannel = FlutterMethodChannel(name: LogAPI.CHANNEL, binaryMessenger: controller as! FlutterBinaryMessenger)
    }
    
    func log(level: String, msg: String){
        logChannel.invokeMethod(level, arguments: "[iOS] -> \(msg)")
    }
    
    func debug(msg: String){
        log(level: LogAPI.DEBUG, msg: msg)
    }
    
    func info(msg: String){
        log(level: LogAPI.INFO, msg: msg)
    }
    
    func warning(msg: String){
        log(level: LogAPI.WARNING, msg: msg)
    }

    func wtf(msg: String){
        log(level: LogAPI.WTF, msg: msg)
    }
    
    func error(msg: String){
        log(level: LogAPI.ERROR, msg: msg)
    }
    
}


