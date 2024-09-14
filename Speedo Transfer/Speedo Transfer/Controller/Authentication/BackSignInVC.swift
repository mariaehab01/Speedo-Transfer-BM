//
//  BackSignInVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 11/09/2024.
//

import UIKit

class BackSignInVC: UIViewController {
    var user: User?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var loginToYourAccountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeBackLabel.font = UIFont(name: Fonts.semiBoldInter, size: 24.0)
        loginToYourAccountLabel.font = UIFont(name: Fonts.regularInter, size: 16.0)

        configureTextFields()
        setupNavBar()
        applyGradientBgWhiteToRed()
    }
    
    func configureTextFields() {
        emailTextField.addRightIcon(image: UIImage(named: "emaiImage")!, padding: 16.0)
        emailTextField.setBorder(color: Colors.textFieldBorderColor)
        passwordTextField.addRightIcon(image: UIImage(named: "eyeImage")!, padding: 16.0)
        passwordTextField.setBorder(color: Colors.textFieldBorderColor)
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        let changePasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.navigationController?.pushViewController(changePasswordVC, animated: true)
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back-arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back-arrow")
        
        navigationItem.leftItemsSupplementBackButton = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    // MARK: - Navigation

    

}
