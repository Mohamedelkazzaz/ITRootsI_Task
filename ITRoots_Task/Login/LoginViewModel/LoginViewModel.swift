//
//  LoginViewModel.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 03/02/2025.
//

import Foundation

class LoginViewModel {
    
    // MARK: - Properties
    var userTypes = ["Admin", "User"]
    var isRTL = false
    
    // In-memory storage for registered users (replace with your actual data source)
    private var registeredUsers: [User] = [
        User(fullName: "Admin User", username: "admin", password: "admin123", email: "admin@example.com", phone: "1234567890"),
        User(fullName: "Test User", username: "user", password: "user123", email: "user@example.com", phone: "0987654321")
    ]
    
    // MARK: - Login
    func login(username: String, password: String, completion: @escaping (Bool, User?) -> Void) {
        if let user = registeredUsers.first(where: { $0.username == username && $0.password == password }) {
            completion(true, user)
        } else {
            completion(false, nil)
        }
    }
    
    // MARK: - Save Logged-In User
    func saveLoggedInUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: "loggedInUser")
        }
    }
    
    // MARK: - Get Logged-In User
    func getLoggedInUser() -> User? {
        if let savedUserData = UserDefaults.standard.data(forKey: "loggedInUser") {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: savedUserData) {
                return user
            }
        }
        return nil
    }
    
    // MARK: - Toggle Language
    func toggleLanguage() {
        isRTL.toggle()
        let currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") == "en" ? "ar" : "en"
        UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
        UserDefaults.standard.synchronize()
        
        NotificationCenter.default.post(name: NSNotification.Name("LanguageChanged"), object: nil)
    }
}
