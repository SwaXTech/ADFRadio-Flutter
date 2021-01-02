import UIKit
import Flutter
import os

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
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
        player.radioURL = URL(string: "https://adfradio.com.ar/radio/8000/live")
        player.play()

    })

    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
