import UIKit
import Flutter
import Firebase
import GoogleMaps // Add this line!


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Google Maps
    GMSServices.provideAPIKey("AIzaSyBzPbFbdMxzLE-NChCr-lBT6atWxHfVmKQ")
    // Firebase
    FirebaseApp.configure()
     
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
