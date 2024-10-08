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
            goToCompleteRegisterScreen()
        }
    }
    
    func saveUserToUserDefaults(user: User) {
        let def = UserDefaults.standard
        do {
            let encodedData = try JSONEncoder().encode(user)
            
            def.set(encodedData, forKey: "user")
        } catch {
            print("Failed to encode user: \(error)")
        }
    }
    
    @IBAction func SignInBtnPressed(_ sender: UIButton) {
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.signInVC) as! SignInVC
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    private func goToCompleteRegisterScreen() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let completeSignupVC = sb.instantiateViewController(withIdentifier: VCS.completeSignUpVC) as! CompleteSignupVC
        let user = User(name: nameTextField.text!.trimmed, email: emailTextField.text!.trimmed, password: pass1TextField.text!.trimmed, pass2: pass2TextField.text!.trimmed)
        completeSignupVC.user = user // Pass the user object
        self.navigationController?.pushViewController(completeSignupVC, animated: true)
    }

    private func isValidData() -> Bool {
        guard let name = nameTextField.text?.trimmed, !name.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your name!")
            return false
        }
        
        guard let email = emailTextField.text?.trimmed, !email.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your email!")
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard let email = emailTextField.text?.trimmed, !email.isEmpty, emailPredicate.evaluate(with: email) else {
            showAlert(title: "Sorry", message: "Please enter a valid email address!")
            return false
        }
        
        guard let password = pass1TextField.text?.trimmed, !password.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your password!")
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
        let user = User(name: name, email: email, password: password1, pass2: password2)
        saveUserToUserDefaults(user: user)
        
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


