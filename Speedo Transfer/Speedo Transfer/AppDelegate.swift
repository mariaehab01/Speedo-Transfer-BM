//
//  AppDelegate.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.main.bounds)
//        
//        let isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
//        if !isFirstLaunch {
//            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
//            let onboardingPageVC = OnboardingPageVC()
//            window?.rootViewController = onboardingPageVC
//        } else {
//            let signUpVC = SignUpVC() // Your main view controller
//            window?.rootViewController = signUpVC
//        }
//        
//        window?.makeKeyAndVisible()
        return true
    }


}

