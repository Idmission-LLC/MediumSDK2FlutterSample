//
//  IDentitySDKHelper.swift
//  IDMissionSDK2_React
//
//  Created by Pranjal Lamba on 29/11/21.
//

import Foundation
import IDentityMediumSDK
import IDCaptureMedium
import SelfieCaptureMedium
import Flutter

class IDentitySDKHelper : NSObject{
  
    @IBAction func initializeSDK(result: @escaping FlutterResult){
        print("initializeSDK")
    let loginId = UserDefaults.standard.string(forKey: "loginId") ?? ""
    let password = UserDefaults.standard.string(forKey: "password") ?? ""
    let merchantId = UserDefaults.standard.string(forKey: "merchantId") ?? ""
        IDentitySDK.initializeApiBaseUrl = UserDefaults.templateModelBaseURL
        IDentitySDK.apiBaseUrl = UserDefaults.apiBaseURL
    IDentitySDK.initializeSDK(loginId: loginId, password: password, merchantId: merchantId) { error in
        if let error = error {
            print(error.localizedDescription)
            result(error.localizedDescription)
        } else {
            print("SDK successfully initialized")
            result("SDK successfully initialized")
        }
    }
  }
  
  // 20 - ID Validation
    @IBAction func startIDValidations(result: @escaping FlutterResult, instance: UIViewController) {
        ViewController().startIDValidation(result: result, instance: instance);
  }
 
  // 10 - ID Validation and Match Face
  @IBAction func startIDValidationAndMatchFaces(result: @escaping FlutterResult, instance: UIViewController) {
    ViewController().startIDValidationAndMatchFace(result: result, instance: instance);
  }
  
  // 50 - ID Validation And Customer Enroll
  @IBAction func startIDValidationAndCustomerEnrolls(result: @escaping FlutterResult, instance: UIViewController) {
    ViewController().startIDValidationAndCustomerEnroll(result: result, instance: instance);
  }
  
  // 175 - Customer Enroll Biometrics
  @IBAction func startCustomerEnrollBiometricss(result: @escaping FlutterResult, instance: UIViewController) {
    ViewController().startCustomerEnrollBiometrics(result: result, instance: instance);
  }
  
  // 105 - Customer Verification
  @IBAction func startCustomerVerifications(result: @escaping FlutterResult, instance: UIViewController) {
    ViewController().startCustomerVerification(result: result, instance: instance);
  }
  
  // 185 - Identify Customer
    @IBAction func startIdentifyCustomers(result: @escaping FlutterResult, instance: UIViewController) {
        ViewController().startIdentifyCustomer(result: result, instance: instance);
  }
  
  // 660 - Live Face Check
    @IBAction func startLiveFaceChecks(result: @escaping FlutterResult, instance: UIViewController) {
        ViewController().startLiveFaceCheck(result: result, instance: instance);
  }
    
    @IBAction func submitResult(result: @escaping FlutterResult, instance: UIViewController) {
        ViewController().submitResult(result: result, instance: instance);
   }
}
