//
//  SignUpVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit

class SignUpVC: UIViewController {
    
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pass1TextField: UITextField!
    @IBOutlet weak var pass2TextField: UITextField!
    
    
    @IBOutlet weak var speedoTransferLabel: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        speedoTransferLabel.font = UIFont(name: Fonts.mediumInter, size: 24.0)
        
        signInButton.setUnderlinedTitle(
            text: "Sign In",
            color: UIColor(red: 0.529, green: 0.118, blue: 0.208, alpha: 1),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )
        

        configureTextFields()
        setupNavBar()
        applyGradientBgWhiteToRed()
    }
    
    func configureTextFields() {
        
                nameTextField.addRightIcon(image: UIImage(named: "personImage")!, padding: 16.0)
                nameTextField.setBorder(color: Colors.textFieldBorderColor)
                emailTextField.addRightIcon(image: UIImage(named: "emaiImage")!, padding: 16.0)
                emailTextField.setBorder(color: Colors.textFieldBorderColor)
                pass1TextField.addRightIcon(image: UIImage(named: "eyeImage")!, padding: 16.0)
                pass1TextField.setBorder(color: Colors.textFieldBorderColor)
                pass2TextField.addRightIcon(image: UIImage(named: "eyeImage")!, padding: 16.0)
                pass2TextField.setBorder(color: Colors.textFieldBorderColor)

    }
    
    @IBAction func SignUpBtnPressed(_ sender: UIButton) {
        print("Sign Up button tapped")
        
        if isValidData() {
            let fullName = nameTextField.text?.trimmed ?? ""
            let email = emailTextField.text?.trimmed ?? ""
            let password1 = pass1TextField.text?.trimmed ?? ""
            let password2 = pass2TextField.text?.trimmed ?? ""
            
            let user = User(name: fullName, email: email, password: password1)
            goToCompleteRegisterScreen(with: user)
        }
    }
    
    @IBAction func SignInBtnPressed(_ sender: UIButton) {
//        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
//        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    private func goToCompleteRegisterScreen(with user: User) {
        let completeSignupVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteSignupVC") as! CompleteSignupVC
        completeSignupVC.user = user
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
        
        // Updated password validation according to user story
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
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back-arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back-arrow")
        let titleLabel = UILabel()
        titleLabel.text = "Sign Up"
        titleLabel.font = UIFont(name: Fonts.regularInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit() // Adjusts the size of the label to fit the content
        self.navigationItem.titleView = titleLabel
        
        navigationItem.leftItemsSupplementBackButton = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
}


