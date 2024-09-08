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
            def.setValue(newValue, forKey: "isLoggedIn")
        } get {
            if def.object(forKey: "isLoggedIn") == nil {
                return nil
            } else {
                return def.bool(forKey: "isLoggedIn")
            }
        }
    }
}
