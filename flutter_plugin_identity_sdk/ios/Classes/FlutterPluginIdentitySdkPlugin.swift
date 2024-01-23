import Flutter
import UIKit

public class FlutterPluginIdentitySdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin_identity_sdk", binaryMessenger: registrar.messenger())
    let instance = FlutterPluginIdentitySdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "idm_sdk_init":
        
        if let args = call.arguments as? Dictionary<String, Any>,
          let loginId = args["loginId"] as? String,
          let password = args["password"] as? String,
          let merchantId = args["merchantId"] as? Int {
          print(loginId)
          UserDefaults.standard.set(String(loginId), forKey: "loginId")
          UserDefaults.standard.set(String(password), forKey: "password")
          UserDefaults.standard.set(String(merchantId), forKey: "merchantId")
        } else {
            print("fallback")
            print(UserDefaults.loginId)
            UserDefaults.standard.set(UserDefaults.loginId, forKey: "loginId")
            UserDefaults.standard.set(UserDefaults.password, forKey: "password")
            UserDefaults.standard.set(UserDefaults.merchantId, forKey: "merchantId")
        }
        IDentitySDKHelper().initializeSDK(result: result)
    case "idm_sdk_serviceID20":
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startIDValidations(result: result, instance: vc);
            }
        }
    case "idm_sdk_serviceID10":
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startIDValidationAndMatchFaces(result: result, instance: vc);
            }
        }
    case "idm_sdk_serviceID50":
        if let args = call.arguments as? Dictionary<String, Any>,
          let uniqueCustomerNumber = args["uniqueCustomerNumber"] as? Int {
          UserDefaults.standard.set(String(uniqueCustomerNumber), forKey: "uniqueCustomerNumber")
        } else {
          UserDefaults.standard.set("0", forKey: "uniqueCustomerNumber")
        }
        
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startIDValidationAndCustomerEnrolls(result: result, instance: vc);
            }
        }
    case "idm_sdk_serviceID175":
        if let args = call.arguments as? Dictionary<String, Any>,
          let uniqueCustomerNumber = args["uniqueCustomerNumber"] as? Int {
          UserDefaults.standard.set(String(uniqueCustomerNumber), forKey: "uniqueCustomerNumber")
        } else {
          UserDefaults.standard.set("0", forKey: "uniqueCustomerNumber")
        }
        
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startCustomerEnrollBiometricss(result: result, instance: vc);
            }
        }
    case "idm_sdk_serviceID105":
        if let args = call.arguments as? Dictionary<String, Any>,
          let uniqueCustomerNumber = args["uniqueCustomerNumber"] as? Int {
          UserDefaults.standard.set(String(uniqueCustomerNumber), forKey: "uniqueCustomerNumber")
        } else {
          UserDefaults.standard.set("0", forKey: "uniqueCustomerNumber")
        }
        
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startCustomerVerifications(result: result, instance: vc);
            }
        }
    case "idm_sdk_serviceID185":
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startIdentifyCustomers(result: result, instance: vc);
            }
        }
    case "idm_sdk_serviceID660":
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().startLiveFaceChecks(result: result, instance: vc);
            }
        }
    case "submit_result":
        DispatchQueue.main.async {
            if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                IDentitySDKHelper().submitResult(result: result, instance: vc);
            }
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    public func sendResponseTo(result: @escaping FlutterResult, resultString: String) {
        result(resultString)
    }
    
}
