//
//  SignInVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 11/09/2024.
//

import UIKit

class SignInVC: UIViewController {
    var user: User?

    @IBOutlet weak var speedoTransferLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        speedoTransferLabel.font = UIFont(name: Fonts.mediumInter, size: 24.0)
        
        signUpButton.setUnderlinedTitle(
            text: "Sign Up",
            color: UIColor(red: 0.529, green: 0.118, blue: 0.208, alpha: 1),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )
        

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
        let backSignInVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.backSignInVC) as! BackSignInVC
        self.navigationController?.pushViewController(backSignInVC, animated: true)
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back-arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back-arrow")
        let titleLabel = UILabel()
        titleLabel.text = "Sign In"
        titleLabel.font = UIFont(name: Fonts.regularInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit() // Adjusts the size of the label to fit the content
        self.navigationItem.titleView = titleLabel
        
        navigationItem.leftItemsSupplementBackButton = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
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
