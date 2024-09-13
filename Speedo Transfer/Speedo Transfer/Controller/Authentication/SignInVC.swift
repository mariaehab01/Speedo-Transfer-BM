//
//  SignInVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab
//

import UIKit

class SignInVC: UIViewController {
    var user: User!

    @IBOutlet weak var speedoTransferLabel: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        speedoTransferLabel.font = UIFont(name: Fonts.mediumInter, size: 24.0)
        
        signUpButton.setUnderlinedTitle(
            text: "Sign Up",
            color: UIColor(hex: "#871E35"),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )
        
        self.navigationItem.hidesBackButton = true

        configureTextFields()
        setupNavBar()
        applyGradientBgWhiteToRed()
        UserDefaultsManager.shared().isLoggedIn = false
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
                let homeVC = sb.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                self.navigationController?.pushViewController(homeVC, animated: true)
            } else {
                showAlert(title: "Sorry", message: "Incorrect email or password.")
            }
        } else {
            showAlert(title: "sorry", message: "No user data found.")
        }
    }
    
  
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func setupNavBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Sign In"
        titleLabel.font = UIFont(name: Fonts.regularInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
