//
//  SignUpVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit

class SignUpVC: UIViewController {
    
   
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var pass1TextField: CustomTextField!
    @IBOutlet weak var pass2TextField: CustomTextField!
    
    
    @IBOutlet weak var speedoTransferLabel: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        speedoTransferLabel.font = UIFont(name: Fonts.mediumInter, size: 24.0)
        
        signInButton.setUnderlinedTitle(
            text: "Sign In",
            color: UIColor(hex: "#871E35"),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )
        

        configureTextFields()
        setupNavBar()
        applyGradientBgWhiteToRed()
    }
    
    func configureTextFields() {
        nameTextField.setType(.name)
        
        emailTextField.setType(.email)
        
        pass1TextField.setType(.password)
        
        pass2TextField.setType(.password)
    }
    
    @IBAction func SignUpBtnPressed(_ sender: UIButton) {
        
        if isValidData() {
            let fullName = nameTextField.text?.trimmed ?? ""
            let email = emailTextField.text?.trimmed ?? ""
            let password1 = pass1TextField.text?.trimmed ?? ""
            let password2 = pass2TextField.text?.trimmed ?? ""
            
            let user = User(name: fullName, email: email, password: password1)
            saveUserToUserDefaults(user: user)
            goToCompleteRegisterScreen()
        }
    }
    
    func saveUserToUserDefaults(user: User) {
        let def = UserDefaults.standard
        do {
            let encodedData = try JSONEncoder().encode(user)
            
            def.set(encodedData, forKey: "savedUser")
        } catch {
            print("Failed to encode user: \(error)")
        }
    }
    
    @IBAction func SignInBtnPressed(_ sender: UIButton) {
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.signInVC) as! SignInVC
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    private func goToCompleteRegisterScreen() {
        let completeSignupVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.completeSignUpVC) as! CompleteSignupVC
        self.navigationController?.pushViewController(completeSignupVC, animated: true)
    }
    
    
    private func isValidData() -> Bool {
        guard let name = nameTextField.text?.trimmed, !name.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your name!")
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard let email = emailTextField.text?.trimmed, !email.isEmpty, emailPredicate.evaluate(with: email) else {
            showAlert(title: "Sorry", message: "Please enter a valid email address!")
            return false
        }
        
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard let password1 = pass1TextField.text?.trimmed, !password1.isEmpty, passwordPredicate.evaluate(with: password1) else {
            showAlert(title: "Sorry", message: "Password must be at least 6 characters long, with at least one uppercase letter, one lowercase letter, and one special character.")
            return false
        }
        
        guard let password2 = pass2TextField.text?.trimmed, !password2.isEmpty else {
            showAlert(title: "Sorry", message: "Please confirm your password!")
            return false
        }
        
        guard password1 == password2 else {
            showAlert(title: "Sorry", message: "Passwords do not match!")
            return false
        }
        
        return true
    }
    
    private func setupNavBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Sign Up"
        titleLabel.font = UIFont(name: Fonts.regularInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
}


