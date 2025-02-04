//
//  LanguageManager.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation
import UIKit

class LanguageManager {
    static let shared = LanguageManager()
    
    private let languageKey = "appLanguage"
    
    var currentLanguage: String {
        return UserDefaults.standard.string(forKey: languageKey) ?? "en"
    }
    
    func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: languageKey)
        UserDefaults.standard.synchronize()
        
        if language == "ar" {
               UIView.appearance().semanticContentAttribute = .forceRightToLeft
           } else {
               UIView.appearance().semanticContentAttribute = .forceLeftToRight
           }
        resetApp()
    }
    
    private func resetApp() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateInitialViewController()
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
    }
}
