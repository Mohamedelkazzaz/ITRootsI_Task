//
//  RegisterViewModel.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation


class RegisterViewModel {
    
    // MARK: - Properties
    private var registeredUsers: [User] = []
    
    // MARK: - Validation
    func validateFields(fullName: String, username: String, password: String, email: String, phone: String) -> String? {
        if fullName.isEmpty { return "Full Name is required." }
        if username.isEmpty { return "Username is required." }
        if password.isEmpty { return "Password is required." }
        if password.count < 6 { return "Password must be at least 6 characters." }
        if email.isEmpty { return "Email is required." }
        if !isValidEmail(email) { return "Invalid email format." }
        if phone.isEmpty { return "Phone is required." }
        if !isValidPhone(phone) { return "Invalid phone number." }
        return nil
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPhone(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }
    
    // MARK: - Register User
    func registerUser(_ user: User) {
        registeredUsers.append(user)
        print("User registered: \(user)")
    }
}
