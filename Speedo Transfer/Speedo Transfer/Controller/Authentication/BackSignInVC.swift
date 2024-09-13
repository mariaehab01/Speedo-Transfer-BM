//
//  BackSignInVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab
//

import UIKit

class BackSignInVC: UIViewController {

    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var loginToYourAccountLabel: UILabel!
    @IBOutlet weak var popUpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeBackLabel.font = UIFont(name: Fonts.semiBoldInter, size: 24.0)
        loginToYourAccountLabel.font = UIFont(name: Fonts.regularInter, size: 16.0)
        popUpLabel.font = UIFont(name: Fonts.mediumInter, size: 12.0)

        self.navigationItem.hidesBackButton = true

        configureTextFields()
        applyGradientBgWhiteToRed()
    }
    
    func configureTextFields() {
        emailTextField.setType(.email)
        passwordTextField.setType(.password)
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        guard let email = emailTextField.text?.trimmed, !email.isEmpty,
              let password = passwordTextField.text?.trimmed, !password.isEmpty else {
            showAlert(title: "Sorry", message: "Please fill all fields")
            return
        }
        
        let def = UserDefaults.standard
        if let savedUserData = def.data(forKey: "user"),
           let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            if email == savedUser.email && password == savedUser.password {
                let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
                let backSignInVC = sb.instantiateViewController(withIdentifier: VCS.backSignInVC) as! BackSignInVC
                self.navigationController?.pushViewController(backSignInVC, animated: true)
            } else {
                showAlert(title: "Sorry", message: "Incorrect email or password.")
            }
        } else {
            showAlert(title: "sorry", message: "No user data found.")
        }
    }
}
