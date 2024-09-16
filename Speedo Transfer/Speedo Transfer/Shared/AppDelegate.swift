//
//  AppDelegate.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let splashScreenVC = sb.instantiateViewController(withIdentifier: VCS.splashScreenVC) as! SplashScreenVC
        let navVC = UINavigationController(rootViewController: splashScreenVC)
        window?.rootViewController = navVC
        
        IQKeyboardManager.shared.enable = true

        return true
    }
}

