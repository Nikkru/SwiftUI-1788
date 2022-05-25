//
//  SessionVK.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 15.05.2022.
//

import Foundation
import SwiftKeychainWrapper

final class SessionVK: ObservableObject {
    
    private init() {}
    
    static let shared = SessionVK()
    
    var token: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "com.gb.token")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "com.gb.token") ?? ""
        }
    }
    
    var userId: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "user.Id")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "user.Id") ?? ""
        }
    }
    
    @Published var isAutorised: Bool = false
    
    var versionVK = "5.81"
    
    var expiresIn = ""
}
