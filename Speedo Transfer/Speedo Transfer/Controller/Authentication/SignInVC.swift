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
        
        NetworkManager.shared.loginUser(email: email, password: password) { result in
             DispatchQueue.main.async {
                 switch result {
                 case .success:
                     
                     let def = UserDefaults.standard
                     let user = User(name: "", email: email, password: password, pass2: "") // Adjust as needed
                     do {
                         let encodedData = try JSONEncoder().encode(user)
                         def.set(encodedData, forKey: "user")
                     } catch {
                         print("Failed to encode user: \(error)")
                     }

                     let sb = UIStoryboard(name: "Main", bundle: nil)
                     guard let homeVC = sb.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC else {
                         print("Failed to instantiate TabBarVC")
                         return
                     }
//                     self.navigationController?.setViewControllers([homeVC], animated: true)
//                     
                     homeVC.modalPresentationStyle = .fullScreen
                     self.present(homeVC, animated: true, completion: nil)

                     
                 case .failure(let error):
                     // Instantiate the ErrorViewController from storyboard
                     let storyboard = UIStoryboard(name: "Main", bundle: nil) // Ensure your storyboard name is correct
                     if let errorVC = storyboard.instantiateViewController(withIdentifier: "ErrorVC") as? ErrorVC {
                         
                         self.present(errorVC, animated: true, completion: nil)
                     }

                 }
             }
         }
        
        let def = UserDefaults.standard
        if let savedUserData = def.data(forKey: "user"),
           let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            if email == savedUser.email && password == savedUser.password {
                let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
                let homeVC = sb.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                
            }
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
}
