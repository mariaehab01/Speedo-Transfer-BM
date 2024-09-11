//
//  UserDefaultsManager.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 08/09/2024.
//

import Foundation

class UserDefaultsManager {
    
    // MARK: - Singleton
    static private let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    // MARK: - Properties
    private let def = UserDefaults.standard
    
    var isLoggedIn: Bool? {
        set{
            def.setValue(newValue, forKey: Keys.isLoggedIn)
        } get {
            if def.object(forKey: Keys.isLoggedIn) == nil {
                return nil
            } else {
                return def.bool(forKey: Keys.isLoggedIn)
            }
        }
    }
    
    var hasSeenOnboarding: Bool? {
        set {
            def.setValue(newValue, forKey: Keys.hasSeenOnboarding)
        }
        get {
            if def.object(forKey: Keys.hasSeenOnboarding) == nil {
                return nil
            } else {
                return def.bool(forKey: Keys.hasSeenOnboarding)
            }
        }
    }
    
    // MARK: - Keys
    private struct Keys {
        static let isLoggedIn = "isLoggedIn"
        static let hasSeenOnboarding = "hasSeenOnboarding"
    }
}
