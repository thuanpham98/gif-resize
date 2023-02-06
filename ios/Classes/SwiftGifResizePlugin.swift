import Flutter
import UIKit
import GifResize

public class SwiftGifResizePlugin: NSObject, FlutterPlugin {
private static var CHANNEL_METHOD = "gif_resize"
    private var _gifResize : Gif_resizeGifResize?  =  Optional<Gif_resizeGifResize>.none
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: CHANNEL_METHOD, binaryMessenger: registrar.messenger())
    let instance = SwiftGifResizePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "init":
          initGifResize(call, result: result)
      case "process":
          processGifResize(call, result: result)
      case "get_height":
          getHeight(call, result: result)
      case "set_height":
          setHeight(call, result: result)
      case "get_width":
          getWidth(call, result: result)
      case "set_width":
          setWidth(call, result: result)
      default:
          result(FlutterMethodNotImplemented)
      }
  }
    
    public func initGifResize(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let rawData: Dictionary<String, Any> = call.arguments as! Dictionary<String, Any>
      let width : Int = rawData["width"] as! Int
      let height : Int = rawData["height"] as! Int
        _gifResize = GifResize.Gif_resizeInit(width, height)
        result("ok")
    }
    
    public func processGifResize(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let rawData: Dictionary<String, Any> = call.arguments as! Dictionary<String, Any>
        let data = Data((rawData["data"] as! FlutterStandardTypedData).data)
        do {
            let dataRet =  try _gifResize?.process(data)
            result(dataRet)
        } catch {
            print("User creation failed with error: \(error)")
            result(nil)
        }
        
    }
    
    public func getHeight(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(_gifResize?.height)
    }
    
    public func setHeight(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let rawData: Dictionary<String, Any> = call.arguments as! Dictionary<String, Any>
      let height : Int = rawData["data"] as! Int
        _gifResize?.height=height
        result("ok")
    }
    
    public func getWidth(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        result(_gifResize?.width)
    }
    
    public func setWidth(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        let rawData: Dictionary<String, Any> = call.arguments as! Dictionary<String, Any>
      let width : Int = rawData["data"] as! Int
        _gifResize?.width=width
        result("ok")
    }
}
 
