import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO: Add your Google Maps API key
GMSServices.provideAPIKey("AIzaSyDJ2pIJcWPOy4kqhTml_9OmyMD0VcC7K9s")



    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
