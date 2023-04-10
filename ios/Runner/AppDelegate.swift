import UIKit
import Flutter
import CobrowseIO

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = (window?.rootViewController as! FlutterViewController)
    let urmoboChannel = FlutterMethodChannel(name: "urmobo", binaryMessenger: controller.binaryMessenger)

    urmoboChannel.setMethodCallHandler({ [weak self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      switch call.method {
        case "startCobrowse":
          if #available(iOS 12.0, *) {
            let arguments : NSDictionary? = call.arguments as? NSDictionary
            let license : String? = arguments!["license"] as? String
            let customData : [String : NSObject]? = arguments!["customData"] as? [String : NSObject]
            
            CobrowseIO.instance().license = license!
            CobrowseIO.instance().customData = customData!
            CobrowseIO.instance().start()
          }
          else {
            result(FlutterMethodNotImplemented)
          }
        default:
          result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
