//
//  UserDefault+Constant.swift
//  AuthGoogleApple
//
//  Created by Apple on 07/08/22.
//

import Foundation
import SwiftUI

struct UserDefaultsKey {
    static let kAuthToken                               = "Token"
    static let kLoginUser                               = "loginUser"
    
    static let kIsNotFirstTime                          = "isNotFirstTime"
    static let kIsUserLoggedIn                          = "isUserLoggedIn"
}

extension UserDefaults {

class var isNotFirstTime : Bool {
    get {
        return UserDefaults.standard.bool(forKey: UserDefaultsKey.kIsNotFirstTime)
    }
    set {
        UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.kIsNotFirstTime)
    }
}
}

