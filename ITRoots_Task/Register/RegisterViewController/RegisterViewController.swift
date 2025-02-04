//
//  RegisterViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    private let viewModel = RegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        guard let fullName = nameTextField.text,
              let username = userNameTextField.text,
              let password = passwordTextField.text,
              let email = emailTextField.text,
              let phone = phoneTextField.text else { return }
        
        if let errorMessage = viewModel.validateFields(fullName: fullName, username: username, password: password, email: email, phone: phone) {
            print(errorMessage)
        } else {
            let user = User(fullName: fullName, username: username, password: password, email: email, phone: phone)
            viewModel.registerUser(user)
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}
