//
//  LoginViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 03/02/2025.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        checkIfUserLoggedIn()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let username = userNameTextField.text, let password = passwordTextField.text else { return }
             
             viewModel.login(username: username, password: password) { success in
                 if success {
                     UserDefaults.standard.set(true, forKey: "isLoggedIn")
                     let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewViewController") as! MainViewViewController
                     self.navigationController?.pushViewController(vc, animated: true)
                 } else {
                     print("Invalid credentials")
                 }
             }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func changeLanguageButtonPressed(_ sender: Any) {
        viewModel.toggleLanguage()
        updateUILayout()
    }
    
    private func updateUILayout() {
        view.semanticContentAttribute = viewModel.isRTL ? .forceRightToLeft : .forceLeftToRight
    }
    
    private func checkIfUserLoggedIn() {
           let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
           if isLoggedIn {
               print("User already logged in, navigate to MainView")
           }
       }
}

extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.userTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.userTypes[row]
    }
}
