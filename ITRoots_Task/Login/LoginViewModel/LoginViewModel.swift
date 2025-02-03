//
//  LoginViewModel.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 03/02/2025.
//

import Foundation

class LoginViewModel {
    var userTypes = ["Admin", "User"]
    var isRTL: Bool = false
    
    func login(username: String, password: String, completion: (Bool) -> Void) {
        if username == "admin" && password == "password" {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func toggleLanguage() {
        isRTL.toggle()
    }
}
