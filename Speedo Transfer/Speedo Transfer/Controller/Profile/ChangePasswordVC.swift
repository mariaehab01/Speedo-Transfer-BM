//
//  ChangePasswordVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab 
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var currentPassTextField: CustomTextField!
    @IBOutlet weak var newPassTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        setupNavBar()
        applyGradientBgYellowToRed()

        self.tabBarController?.tabBar.isHidden = false

    }
    

    @IBAction func saveBtnTapped(_ sender: UIButton) {
        if isValidData() {
            updatePasswordInUserDefaults()
            
            let alert = UIAlertController(title: "Done", message: "Password updated successfully!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func isValidData() -> Bool {
        guard let currentPassword = currentPassTextField.text?.trimmed, !currentPassword.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your current password!")
            return false
        }
        
        guard let savedUserData = UserDefaults.standard.data(forKey: "user"),
              let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) else {
            showAlert(title: "Error", message: "No user data found.")
            return false
        }
        
        guard currentPassword == savedUser.password else {
            showAlert(title: "Sorry", message: "Incorrect current password.")
            return false
        }
        
        guard let newPassword = newPassTextField.text?.trimmed, !newPassword.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter a new password!")
            return false
        }
        
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard let newPassword = newPassTextField.text?.trimmed, !newPassword.isEmpty, passwordPredicate.evaluate(with: newPassword) else {
            showAlert(title: "Sorry", message: "Password must be at least 6 characters long, with at least one uppercase letter, one lowercase letter, and one special character.")
            return false
        }
        return true
    }
    
    private func updatePasswordInUserDefaults() {
        // Retrieve and decode the saved user data
        guard let savedUserData = UserDefaults.standard.data(forKey: "user"),
              var savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) else {
            return
        }
        
        // Update the user's password
        if let newPassword = newPassTextField.text?.trimmed {
            savedUser.password = newPassword
        }
        
        // Encode and save the updated user data back to UserDefaults
        if let updatedUserData = try? JSONEncoder().encode(savedUser) {
            UserDefaults.standard.set(updatedUserData, forKey: "user")
        }
    }
    
    func configureTextFields() {

        currentPassTextField.setType(.password)
        newPassTextField.setType(.password)
        
    }
    
    private func setupNavBar() {

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
        let titleLabel = UILabel()
        titleLabel.text = "Change Password"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    

}
