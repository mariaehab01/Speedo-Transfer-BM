//
//  CompleteSignupVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 10/09/2024.
//

import UIKit
import FittedSheets

class CompleteSignupVC: UIViewController {
    
    var user: User!

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var countryTextField: CustomTextField!
    @IBOutlet weak var dobTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyGradientBgWhiteToRed()
        
        signInButton.setUnderlinedTitle(
            text: "Sign In",
            color: UIColor(hex: "#871E35"),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )
        
        countryTextField.isUserInteractionEnabled = true
        dobTextField.isUserInteractionEnabled = true

        setupNavBar()
        configureTextFields()
        
    }
    
    func configureTextFields() {
        countryTextField.setType(.country)
        
        countryTextField.addTarget(self, action: #selector(showCountryPicker), for: .editingDidBegin)
        
        dobTextField.setType(.dateOfBirth)
        
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        if isValidData() {
            guard let user = user else {
                showAlert(title: "Error", message: "User data is missing")
                return
            }
            
            let country = countryTextField.text!.trimmed
            let dob = dobTextField.text!.trimmed
            
            // Call the API using NetworkManager
            NetworkManager.shared.registerUser(user: user, country: country, dob: dob) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success:
//                        self.showAlert(title: "Success", message: "Registration completed!")
                        self.goToSignInScreen()
                    case .failure(let error):
                        self.showAlert(title: "Error", message: error.localizedDescription)
                    }
                }
            }
//            self.goToSignInScreen()
        }
    }

    
    private func isValidData() -> Bool {
        guard let country = countryTextField.text, !country.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your country!")
            return false
        }
        guard let dob = dobTextField.text, !dob.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your date of birth!")
            return false
        }
        return true
    }

    @IBAction func signInBtnTapped(_ sender: UIButton) {
        self.goToSignInScreen()
    }
    
    private func goToSignInScreen() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let signInVC = sb.instantiateViewController(withIdentifier: VCS.signInVC) as! SignInVC
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    private func setupNavBar() {
        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
    }

}

extension CompleteSignupVC: CountrySelectionDelegate {
    
    @objc func showCountryPicker() {
        guard let countrylist = storyboard?.instantiateViewController(withIdentifier: "CountryListVC") as? CountryListVC else {
            return
        }
        
        countrylist.delegate = self
        
        let sheetController = SheetViewController(controller: countrylist, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius = 50
        sheetController.gripColor = UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func didSelectCountry(country: Country) {
        countryTextField.text = country.label
    }
}
