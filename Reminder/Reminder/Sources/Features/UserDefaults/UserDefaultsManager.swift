//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 28/06/26.
//

import Foundation
import UIKit

class UserDefaultsManager {
    private static let userKey = "userKey"
    private static let userNameKey = "userName"
    private static let userProfileImageKey = "userProfileImage"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
        
    }
    
    static func loadUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
        }
        
        return nil
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.removeObject(forKey: userProfileImageKey)
        UserDefaults.standard.synchronize()
    }
    
    static func saveUsername(username: String) {
        UserDefaults.standard.set(username, forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
    
    static func loadUsername() -> String? {
        return UserDefaults.standard.string(forKey: userNameKey)
    }
    
    static func removeUsername() {
        UserDefaults.standard.removeObject(forKey: userNameKey)
        UserDefaults.standard.synchronize()
    }
    
    static func saveProfileImage(profileImage: UIImage) {
        if let profileImage = profileImage.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(profileImage, forKey: userProfileImageKey)
        }
    }
    
    static func loadProfileImage() -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: userProfileImageKey) {
            return UIImage(data: imageData)
        }
        
        return UIImage(named: "noProfileImage")
    }
    
    static func removeProfileImage() {
        UserDefaults.standard.removeObject(forKey: userProfileImageKey)
        UserDefaults.standard.synchronize()
    }
}
