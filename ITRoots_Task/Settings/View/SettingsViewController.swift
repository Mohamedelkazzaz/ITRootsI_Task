//
//  SettingsViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var isRTL = false

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func changeLanguageButtonPressed(_ sender: UIButton) {
        toggleLanguage()
        updateUILayout()
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateUILayout() {
        view.semanticContentAttribute = isRTL ? .forceRightToLeft : .forceLeftToRight
    }
    
    func toggleLanguage() {
        isRTL.toggle()
        let currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") == "en" ? "ar" : "en"
        UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
        UserDefaults.standard.synchronize()
        
        NotificationCenter.default.post(name: NSNotification.Name("LanguageChanged"), object: nil)
    }
}
